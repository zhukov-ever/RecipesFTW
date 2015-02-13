//
//  iKKEmailSend+UIViewController.h
//  RecipesFTW
//
//  Created by Zhn on 14/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

@interface UIViewController (iKKEmailSend) <MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) MFMailComposeViewController *mailer;

- (void) sendMailTo:(NSString*)recipient
            subject:(NSString*)subject;

@end