//
//  DateHelper.m
//  RecipesFTW
//
//  Created by Zhn on 13/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "DateHelper.h"

@implementation DateHelper

static NSDateFormatter* _df;
+ (NSDateFormatter*) dateFormatter
{
    if (!_df)
    {
        _df = [NSDateFormatter new];
        _df.dateFormat = @"yyyy-MM-dd HH:mm";
    };
    return _df;
}

@end
