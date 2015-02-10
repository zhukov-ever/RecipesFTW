//
//  ObjectParser.m
//  RecipesFTW
//
//  Created by Zhn on 11/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "ObjectParser.h"

@implementation ObjectParser

+ (id) objectFromAPI:(id)obj
       returnedClass:(Class)objClass
{
    if (obj == nil ||
        [obj isEqual:[NSNull null]])
    {
        if (objClass == [NSString class])
            return @"";
        if ([obj isKindOfClass:[NSNumber class]])
            return @0;
    }
    
    if (objClass == [NSString class])
    {
        if ([obj isKindOfClass:[NSString class]])
            return obj;
        if ([obj isKindOfClass:[NSNumber class]])
            return [NSString stringWithFormat:@"%@", obj];
    }
    else if (objClass == [NSNumber class])
    {
        if ([obj isKindOfClass:[NSString class]])
        {
            NSNumberFormatter* _nf = [NSNumberFormatter new];
            _nf.decimalSeparator = @".";
            NSNumber* _rezult = [_nf numberFromString:obj];
            return _rezult;
        }
        if ([obj isKindOfClass:[NSNumber class]])
            return obj;
    }
    if (objClass == [NSString class])
        return @"";
    if ([obj isKindOfClass:[NSNumber class]])
        return @0;
    
    return nil;
}

@end
