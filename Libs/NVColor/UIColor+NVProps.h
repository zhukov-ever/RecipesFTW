//
//  NSObject+UIColor_Xprops.h
//  iAmLucky
//
//  Created by Nikita on 12/15/13.
//  Copyright (c) 2013 Home. All rights reserved.
//
//  Special tnx for stackoverflow
//

#import <UIKit/UIKit.h>

@interface UIColor (NVProps)

- (UIImage*) image;

+ (UIColor*) colorWithR:(int)r g:(int)g b:(int)b a:(int)a;

+ (UIColor*) colorWithHexString:(NSString*)hexString;

@end
