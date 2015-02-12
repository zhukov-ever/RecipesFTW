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

@protocol Theming <NSObject>

- (void) navigationBar:(UINavigationBar*)navigationBar;
- (void) backgroundView:(UIView*)view;
- (void) tableView:(UITableView*)tableView;
- (void) cell:(UITableViewCell*)cell;

- (void) label:(UILabel*)label;
- (void) labelSecondary:(UILabel*)label;
- (void) buttonFavorite:(UIButton*)button;
- (void) imageView:(UIImageView*)imageView;
- (void) textView:(UITextView*)textView;

@end
