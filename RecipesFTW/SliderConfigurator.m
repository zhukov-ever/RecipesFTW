//
//  SliderConfigurator.m
//  RecipesFTW
//
//  Created by Zhn on 10/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "SliderConfigurator.h"

@implementation SliderConfigurator

+ (void) switchOnSwipe:(UIViewController*)vc
{
    [vc.slidingViewController.topViewController.view addGestureRecognizer:vc.slidingViewController.panGesture];
    vc.slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGesturePanning | ECSlidingViewControllerAnchoredGestureTapping;
}

+ (void) switchOffSwipe:(UIViewController*)vc
{
    [vc.slidingViewController.topViewController.view removeGestureRecognizer:vc.slidingViewController.panGesture];
    vc.slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureNone;
}

+ (void) swipeRightFrom:(UIViewController*)vc
{
    [vc.slidingViewController anchorTopViewToRightAnimated:YES];
}

@end
