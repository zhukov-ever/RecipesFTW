//
//  Recipe.h
//  RecipesFTW
//
//  Created by Zhn on 11/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

+ (instancetype) objectFromDictionary:(NSDictionary*)dictionary;

@property (nonatomic) NSInteger theId;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* desc;
@property (nonatomic, strong) NSNumber* difficulty;
@property (nonatomic, getter=isFavorite) BOOL favorite;
@property (nonatomic, strong) NSString* instructions;
@property (nonatomic, strong) NSDate* dateCreate;
@property (nonatomic, strong) NSDate* dateUpdate;
@property (nonatomic, strong) NSString* imageUrlString;


@end
