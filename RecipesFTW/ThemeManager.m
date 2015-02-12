//
//  ThemeManager.m
//  RecipesFTW
//
//  Created by Zhn on 13/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "ThemeManager.h"
#import "ThemeSimple.h"

@implementation ThemeManager
@synthesize type = m_type, theme = m_theme;

+ (instancetype)shared
{
    return [ThemeManager sharedWithClass:[ThemeManager class]];
}

- (instancetype)init
{
    if (self = [super init])
    {
        self.type = ThemeTypeSimple;
    }
    return self;
}

- (void)setType:(ThemeTypes)type
{
    if (m_type != type)
    {
        m_type = type;
        switch (m_type) {
            case ThemeTypeSimple:
            {
                m_theme = [ThemeSimple new];
            }   break;
        }
    }
}

- (id<Theming>)theme
{
    return m_theme;
}

@end
