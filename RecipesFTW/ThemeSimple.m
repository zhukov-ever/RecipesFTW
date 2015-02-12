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

#define kFontNormal @"HelveticaNeue"
#define kFontBoldItalic @"HelveticaNeue-BoldItalic"
#define kFontLight @"HelveticaNeue-Light"
#define kFontItalic @"HelveticaNeue-Italic"
#define kFontUltraLightItalic @"HelveticaNeue-UltraLightItalic"
#define kFontCondensedBold @"HelveticaNeue-CondensedBold"
#define kFontMediumItalic @"HelveticaNeue-MediumItalic"
#define kFontThin @"HelveticaNeue-Thin"
#define kFontMedium @"HelveticaNeue-Medium"
#define kFontThinItalic @"HelveticaNeue-ThinItalic"
#define kFontLightItalic @"HelveticaNeue-LightItalic"
#define kFontUltraLight @"HelveticaNeue-UltraLight"
#define kFontBold @"HelveticaNeue-Bold"
#define kFontCondensedBlack @"HelveticaNeue-CondensedBlack"

@implementation ThemeSimple

- (void) navigationBar:(UINavigationBar*)navigationBar;
{
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    [navigationBar setBarTintColor:[UIColor colorWithHexString:@"744253"]];
    [navigationBar setTintColor:[UIColor colorWithHexString:@"#F3D9DC"]];
    [navigationBar setTitleTextAttributes:@{
                                            NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F3D9DC"],
                                            NSFontAttributeName:[UIFont fontWithName:kFontItalic size:18]
                                            }];
}

- (void) backgroundView:(UIView*)view
{
    [view setBackgroundColor:[UIColor colorWithHexString:@"#F3D9DC"]];
}

- (void) tableView:(UITableView*)tableView
{
    [tableView setBackgroundColor:[UIColor colorWithHexString:@"#F3D9DC"]];
    [tableView setSeparatorInset:UIEdgeInsetsZero];
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setPreservesSuperviewLayoutMargins:NO];
    }
    
    tableView.separatorColor = [UIColor colorWithHexString:@"#B49286"];
}

- (void) cell:(UITableViewCell*)cell
{
    [cell setBackgroundColor:[UIColor clearColor]];
    [cell setSeparatorInset:UIEdgeInsetsZero];
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void) label:(UILabel*)label
{
    label.textColor = [UIColor colorWithHexString:@"744253"];
    label.font = [UIFont fontWithName:kFontItalic size:16];
}

- (void) labelSecondary:(UILabel*)label
{
    label.textColor = [UIColor colorWithHexString:@"744253"];
    label.font = [UIFont fontWithName:kFontLightItalic size:14];
}

- (void) buttonFavorite:(UIButton*)button
{
    [button setTitle:@"" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"button-fav-n"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"button-fav-s"] forState:UIControlStateSelected];
}

- (void) imageView:(UIImageView*)imageView
{
    imageView.backgroundColor = [UIColor colorWithHexString:@"D7BEA8"];
}

- (void) textView:(UITextView*)textView
{
    textView.backgroundColor = [UIColor clearColor];
    textView.textColor = [UIColor colorWithHexString:@"744253"];
    textView.font = [UIFont fontWithName:kFontItalic size:14];
}

@end
