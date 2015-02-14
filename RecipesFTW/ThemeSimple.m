//
//  ThemeSimple.m
//  RecipesFTW
//
//  Created by Zhn on 13/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "ThemeSimple.h"
#import <UIKit/UIKit.h>
#import "UIColor+NVProps.h"
#import <AXRatingView/AXRatingView.h>

#define kFontBoldItalic @"HelveticaNeue-BoldItalic"
#define kFontItalic @"HelveticaNeue-Italic"
#define kFontUltraLightItalic @"HelveticaNeue-UltraLightItalic"
#define kFontMediumItalic @"HelveticaNeue-MediumItalic"
#define kFontThinItalic @"HelveticaNeue-ThinItalic"
#define kFontLightItalic @"HelveticaNeue-LightItalic"

#define kColorLight @"F3D9DC"
#define kColorLightSecondary @"D7BEA8"
#define kColorDark @"744253"
#define kColorDarkSecondary @"C78283"
#define kColorNeutral @"B49286"

@implementation ThemeSimple


#pragma mark - navigation bar

- (void) navigationBar:(UINavigationBar*)navigationBar;
{
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    [navigationBar setBarTintColor:[UIColor colorWithHexString:kColorDark]];
    [navigationBar setTintColor:[UIColor colorWithHexString:kColorLight]];
    [navigationBar setTitleTextAttributes:@{
                                            NSForegroundColorAttributeName:[UIColor colorWithHexString:kColorLight],
                                            NSFontAttributeName:[UIFont fontWithName:kFontItalic size:19]
                                            }];
}

- (void) navigationBarButtonMenu:(UIBarButtonItem*)barButton
{
    [barButton setTitle:@""];
    [barButton setTintColor:[UIColor colorWithHexString:kColorLight]];
    [barButton setImage:[[UIImage imageNamed:@"menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
}

- (void) navigationBarButtonSkip:(UIBarButtonItem*)barButton
{
    [barButton setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:kFontItalic size:16]}
                             forState:UIControlStateNormal];
}


#pragma mark - standart controls

- (void) label:(UILabel*)label
{
    label.textColor = [UIColor colorWithHexString:kColorDark];
    label.font = [UIFont fontWithName:kFontItalic size:16];
}

- (void) labelSecondary:(UILabel*)label
{
    label.textColor = [UIColor colorWithHexString:kColorDark];
    label.font = [UIFont fontWithName:kFontLightItalic size:14];
}
- (void) labelLink:(UILabel*)label
{
    label.textColor = [UIColor colorWithHexString:kColorDark];
    NSDictionary* _attributes = @{
                                  NSFontAttributeName:[UIFont fontWithName:kFontItalic size:16],
                                  NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)
                                  };
    label.attributedText = [[NSAttributedString alloc] initWithString:label.text
                                                           attributes:_attributes];
}

- (void) buttonFavorite:(UIButton*)button
{
    [button setTitle:@"" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"button-fav-n"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"button-fav-s"] forState:UIControlStateSelected];
}

- (void) imageView:(UIImageView*)imageView
{
    imageView.backgroundColor = [UIColor colorWithHexString:kColorLightSecondary];
}

- (void) textView:(UITextView*)textView
{
    textView.backgroundColor = [UIColor clearColor];
    textView.textColor = [UIColor colorWithHexString:kColorDark];
    textView.font = [UIFont fontWithName:kFontItalic size:14];
}
- (void) ratingVeiw:(AXRatingView*)ratingVeiw
{
    ratingVeiw.highlightColor = [UIColor colorWithHexString:kColorDark];
    ratingVeiw.baseColor = [UIColor colorWithHexString:kColorLightSecondary];
}
- (void) pageControl:(UIPageControl*)pageControl
{
    [pageControl setPageIndicatorTintColor:[UIColor colorWithHexString:kColorNeutral]];
    [pageControl setCurrentPageIndicatorTintColor:[UIColor colorWithHexString:kColorDark]];
}
- (void) backgroundView:(UIView*)view
{
    [view setBackgroundColor:[UIColor colorWithHexString:kColorLight]];
}

- (void) tableView:(UITableView*)tableView
{
    [tableView setBackgroundColor:[UIColor colorWithHexString:kColorLight]];
    [tableView setSeparatorInset:UIEdgeInsetsZero];
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setPreservesSuperviewLayoutMargins:NO];
    }
    
    tableView.separatorColor = [UIColor colorWithHexString:kColorNeutral];
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void) cell:(UITableViewCell*)cell
{
    [cell setBackgroundColor:[UIColor colorWithHexString:kColorLight]];
    [cell setSeparatorInset:UIEdgeInsetsZero];
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
}



#pragma mark - menu

- (void) menuTableView:(UITableView*)tableView
{
    [tableView setBackgroundColor:[UIColor colorWithHexString:kColorDark]];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}
- (void) menuCell:(UITableViewCell*)cell
{
    [cell setBackgroundColor:[UIColor colorWithHexString:kColorDark]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
}
- (void) menuLabel:(UILabel*)label
{
    label.textColor = [UIColor colorWithHexString:kColorLight];
    NSDictionary* _attributes = @{
                                  NSFontAttributeName:[UIFont fontWithName:kFontItalic size:19]
                                  };
    label.attributedText = [[NSAttributedString alloc] initWithString:label.text
                                                           attributes:_attributes];
}
- (void) menuFavoriteIco:(UIImageView*)imageView
{
    [imageView setImage:[UIImage imageNamed:@"button-fav-s"]];
}




#pragma mark - presentation

- (void) presentationImageView:(UIImageView*)imageView
{
    imageView.backgroundColor = [UIColor colorWithHexString:kColorDarkSecondary];
    imageView.layer.cornerRadius = CGRectGetWidth(imageView.frame) / 2;
    imageView.clipsToBounds = YES;
}

@end
