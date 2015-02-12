//
//  AlertManager.m
//  RecipesFTW
//
//  Created by Zhn on 13/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "AlertManager.h"
#import <UIKit/UIAlertView.h>

@implementation AlertManager

+ (instancetype)shared
{
    return [AlertManager sharedWithClass:[AlertManager class]];
}


- (UIAlertView*) alertForError:(NSError*)error
{
    return [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
}

@end
