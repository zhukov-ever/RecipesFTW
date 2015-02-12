//
//  ThemeManager.h
//  RecipesFTW
//
//  Created by Zhn on 13/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "NVBaseSingleton.h"
#import "Theming.h"

typedef NS_ENUM(NSInteger, ThemeTypes)
{
    ThemeTypeSimple = 1
};

@interface ThemeManager : NVBaseSingleton

@property (nonatomic) ThemeTypes type;
@property (nonatomic, strong) id<Theming> theme;

@end
