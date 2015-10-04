//
//  GenerateHTMLForJupyter.m
//  jupyter-notebook-quick-look
//
//  Created by Jan Studený on 04/10/15.
//  Copyright © 2015 Jan Studený. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GenerateHTMLForJupyter.h"

NSString * GenerateHTMLForJupyter(NSURL * notebook_url) {
    NSTask * list = [[NSTask alloc] init];
    NSString * notebook_path = [notebook_url path];
    list.launchPath = @"/usr/local/bin/python3";
    list.currentDirectoryPath = @"/";
    NSString * out_path = [NSString stringWithFormat:@"/tmp/%@.html",[[NSUUID UUID] UUIDString]];
    list.arguments = @[@"-m", @"nbconvert", @"--to", @"html", notebook_path, @"--output", out_path];
    [list launch];
    [list waitUntilExit];
    return out_path;
}