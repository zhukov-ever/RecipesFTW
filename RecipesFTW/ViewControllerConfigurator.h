//
//  ViewControllerConfigurator.h
//  RecipesFTW
//
//  Created by Zhn on 10/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+ECSlidingViewController.h"

@interface ViewControllerConfigurator : NSObject

+ (void) switchOnSwipe:(UIViewController*)vc;
+ (void) switchOffSwipe:(UIViewController*)vc;
+ (void) swipeRightFrom:(UIViewController*)vc;

@end
