//
//  Theming.h
//  RecipesFTW
//
//  Created by Zhn on 13/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UINavigationBar;
@class UIView;
@class UITableView;
@class UITableViewCell;
@class UIButton;
@class UILabel;
@class UIImageView;
@class UITextView;
@class AXRatingView;
@class UIBarButtonItem;

@protocol Theming <NSObject>

- (void) navigationBar:(UINavigationBar*)navigationBar;
- (void) navigationBarButtonMenu:(UIBarButtonItem*)barButton;
- (void) backgroundView:(UIView*)view;


- (void) tableView:(UITableView*)tableView;
- (void) cell:(UITableViewCell*)cell;


- (void) menuTableView:(UITableView*)tableView;
- (void) menuCell:(UITableViewCell*)cell;
- (void) menuLabel:(UILabel*)label;


- (void) label:(UILabel*)label;
- (void) labelSecondary:(UILabel*)label;


- (void) labelLink:(UILabel*)label;
- (void) buttonFavorite:(UIButton*)button;
- (void) imageView:(UIImageView*)imageView;
- (void) textView:(UITextView*)textView;
- (void) ratingVeiw:(AXRatingView*)ratingVeiw;

@end
