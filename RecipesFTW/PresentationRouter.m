//
//  PresentationRouter.m
//  RecipesFTW
//
//  Created by Zhn on 12/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "PresentationRouter.h"
#import "PresentationViewController.h"

#define kIsFirstLoad @"kIsFirstLoad"

@implementation PresentationRouter

- (void) gotoMeFrom:(UIViewController*)vc
{
    NSUserDefaults *_userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber* _isFirstLoad = [_userDefaults objectForKey:@"kIsFirstLoad"];
    if (!_isFirstLoad || [_isFirstLoad boolValue] == YES)
    {
        UIStoryboard* _sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        PresentationViewController* _vc =[_sb instantiateViewControllerWithIdentifier:@"PresentationViewController"];
        _vc.navigationItem.leftBarButtonItem = nil;
        UINavigationController* _nc = [[UINavigationController alloc] initWithRootViewController:_vc];
        _nc.navigationBar.translucent = NO;
        
        [vc.navigationController presentViewController:_nc animated:YES completion:nil];
        
        [_userDefaults setObject:@(0) forKey:kIsFirstLoad];
        [_userDefaults synchronize];
    }
    

}

@end
