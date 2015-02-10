//
//  Recipe.m
//  RecipesFTW
//
//  Created by Zhn on 11/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "Recipe.h"
#import "ObjectParser.h"

@implementation Recipe

+ (instancetype)objectFromDictionary:(NSDictionary *)dictionary
{
    Recipe* _recipe = [Recipe new];
    
    NSNumber* _numberId = apiObj([dictionary objectForKey:@"id"], [NSNumber class]);
    if (!_numberId) return nil;
    _recipe.theId = [_numberId integerValue];
    
    _recipe.name = apiObj([dictionary objectForKey:@"name"], [NSString class]);
    _recipe.desc = apiObj([dictionary objectForKey:@"description"], [NSString class]);
    _recipe.difficulty = apiObj([dictionary objectForKey:@"difficulty"], [NSNumber class]);
    NSNumber* _numberFavorite = apiObj([dictionary objectForKey:@"favorite"], [NSNumber class]);
    _recipe.favorite = _numberFavorite ? [_numberFavorite boolValue] : NO;
    _recipe.instructions = apiObj([dictionary objectForKey:@"instructions"], [NSString class]);
    
    NSDateFormatter* _dateFormatter = [NSDateFormatter new];
    _dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSSZ";
    NSString* _dateStringCreate = apiObj([dictionary objectForKey:@"created_at"], [NSString class]);
    _recipe.dateCreate = [_dateFormatter dateFromString:_dateStringCreate];
    NSString* _dateStringUpdate = apiObj([dictionary objectForKey:@"updated_at"], [NSString class]);
    _recipe.dateUpdate = [_dateFormatter dateFromString:_dateStringUpdate];
    
    NSDictionary* _dictPhoto = [dictionary objectForKey:@"photo"];
    _recipe.imageUrlString = apiObj([_dictPhoto objectForKey:@"url"], [NSString class]);
    
    return _recipe;
}


@end
