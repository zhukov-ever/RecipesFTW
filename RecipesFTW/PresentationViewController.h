//
//  PresentationViewController.h
//  RecipesFTW
//
//  Created by Zhn on 10/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresentationViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)menuHandler:(id)sender;
- (IBAction)skipHandler:(id)sender;

@end
