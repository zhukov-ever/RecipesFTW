//
//  PresentationViewController.m
//  RecipesFTW
//
//  Created by Zhn on 10/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "PresentationViewController.h"
#import "SliderConfigurator.h"
#import "ThemeManager.h"

@interface PresentationViewController () <UIScrollViewDelegate>

@end

@implementation PresentationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [SliderConfigurator switchOnSwipe:self];
    
    self.scrollView.delegate = self;
    
    [[[ThemeManager shared] theme] navigationBar:self.navigationController.navigationBar];
    [[[ThemeManager shared] theme] navigationBarButtonMenu:self.navigationItem.leftBarButtonItem];
    [[[ThemeManager shared] theme] navigationBarButtonSkip:self.navigationItem.rightBarButtonItem];
    
    [[[ThemeManager shared] theme] backgroundView:self.view];
    [[[ThemeManager shared] theme] pageControl:self.pageControl];
    
    for (UILabel* _label in self.arrayTitle)
    {
        [[[ThemeManager shared] theme] label:_label];
    }
    for (UIImageView* _imageView in self.arrayImageView)
    {
        [[[ThemeManager shared] theme] presentationImageView:_imageView];
    }
    
    [self.arrayImageView[0] setImage:[UIImage imageNamed:@"ponu"]];
    [self.arrayImageView[1] setImage:[UIImage imageNamed:@"drako"]];
    [self.arrayImageView[2] setImage:[UIImage imageNamed:@"corn"]];
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
