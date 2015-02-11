//
//  PresentationViewController.m
//  RecipesFTW
//
//  Created by Zhn on 10/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "PresentationViewController.h"
#import "SliderConfigurator.h"

@interface PresentationViewController () <UIScrollViewDelegate>

@end

@implementation PresentationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [SliderConfigurator switchOnSwipe:self];
    
    self.scrollView.delegate = self;
}

- (IBAction)menuHandler:(id)sender
{
    [SliderConfigurator swipeRightFrom:self];
}

- (IBAction)skipHandler:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - UIScrollViewDelegate


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat _x = scrollView.contentOffset.x;
    CGFloat _w = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat _shift = ((_x + _w/2.0 ) / _w);
    self.pageControl.currentPage = (int)_shift;
    
    if (_shift > 2.6 && self.navigationItem.rightBarButtonItem)
    {
        [self skipHandler:nil];
    }
}

@end
