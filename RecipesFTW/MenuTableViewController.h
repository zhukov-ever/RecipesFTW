//
//  MenuTableViewController.h
//  RecipesFTW
//
//  Created by Zhn on 10/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTableViewController : UITableViewController

@property (strong, nonatomic) IBOutletCollection(UITableViewCell) NSArray *arrayCell;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewFavorite;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *arrayCellTitle;


@end
