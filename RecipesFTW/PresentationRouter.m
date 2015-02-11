//
//  PresentationRouter.m
//  RecipesFTW
//
//  Created by Zhn on 12/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "PresentationRouter.h"
#import "PresentationViewController.h"

@implementation PresentationRouter

- (void) gotoMeFrom:(UIViewController*)vc
{
    static dispatch_once_t _predicate;
    dispatch_once(&_predicate, ^{
        UIStoryboard* _sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        PresentationViewController* _vc =[_sb instantiateViewControllerWithIdentifier:@"PresentationViewController"];
        _vc.navigationItem.leftBarButtonItem = nil;
        UINavigationController* _nc = [[UINavigationController alloc] initWithRootViewController:_vc];
        _nc.navigationBar.translucent = NO;
        [vc.navigationController presentViewController:_nc animated:YES completion:nil];
    });

}

@end
