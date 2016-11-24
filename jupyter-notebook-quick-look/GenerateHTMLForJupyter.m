//
//  GenerateHTMLForJupyter.m
//  jupyter-notebook-quick-look
//
//  Created by Jan Studený on 04/10/15.
//  Copyright © 2015 Jan Studený. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GenerateHTMLForJupyter.h"
#import "MD5Hash.h"
NSString * GenerateHTMLForJupyter(NSURL * notebook_url) {
    NSTask * list = [[NSTask alloc] init];
    NSString * notebook_path = [notebook_url path];
    NSStringEncoding enc;
    NSString * content = [NSString stringWithContentsOfFile:notebook_path usedEncoding:&enc error:NULL];
    NSString * digest = [content MD5Hash];
    list.launchPath = @"/usr/bin/env";
    list.environment = [NSDictionary dictionaryWithObjectsAndKeys:@"en_US.UTF-8", @"LC_ALL", nil];
    list.currentDirectoryPath = @"/";
    NSString * out_path = [NSString stringWithFormat:@"/tmp/%@.html",digest];
    list.arguments = @[@"python", @"-m", @"nbconvert", @"--to", @"html", notebook_path, @"--output", out_path];
    if (![[NSFileManager defaultManager] fileExistsAtPath:out_path]) {
        [list launch];
        [list waitUntilExit];
    }
    return out_path;
}
