//
//  ResizableTextView.m
//  RecipesFTW
//
//  Created by Zhn on 13/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//
//  http://stackoverflow.com/a/24950357
//

#import "ResizableTextView.h"

@implementation ResizableTextView

- (void) updateConstraints
{
    CGSize contentSize = [self sizeThatFits:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)];
    
    [self.constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *constraint, NSUInteger idx, BOOL *stop) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = contentSize.height;
            *stop = YES;
        }
    }];
    
    [super updateConstraints];
}

@end
