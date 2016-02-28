//
//  MD5Hash.m
//  jupyter-notebook-quick-look
//
//  Created by Jan Studený on 28/02/16.
//  Copyright © 2016 Jan Studený. All rights reserved.
//
#import "MD5Hash.h"
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (MD5)

- (NSString *)MD5Hash {
    const char *cstr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cstr, strlen(cstr), result);
    
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end