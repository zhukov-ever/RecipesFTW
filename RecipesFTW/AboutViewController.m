//
//  AboutViewController.m
//  RecipesFTW
//
//  Created by Zhn on 10/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "AboutViewController.h"
#import "SliderConfigurator.h"
#import "ThemeManager.h"

@implementation AboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [SliderConfigurator switchOnSwipe:self];
    
    [[[ThemeManager shared] theme] navigationBar:self.navigationController.navigationBar];
    [[[ThemeManager shared] theme] navigationBarButtonMenu:self.navigationItem.leftBarButtonItem];
    [[[ThemeManager shared] theme] backgroundView:self.view];
    [[[ThemeManager shared] theme] label:self.labelName];
    [[[ThemeManager shared] theme] labelLink:self.labelEmail];
    
}

- (IBAction)menuHandler:(id)sender
{
    [SliderConfigurator swipeRightFrom:self];
}

- (IBAction)emailHandler:(id)sender
{
    NSURL* _url = [NSURL URLWithString:@"mailto://zhukov.ever@gmail.com"];
    [[UIApplication sharedApplication] openURL:_url];
}

@end
