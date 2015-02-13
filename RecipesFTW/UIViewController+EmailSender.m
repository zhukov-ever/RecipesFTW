//
//  iKKEmailSend+UIViewController.m
//  RecipesFTW
//
//  Created by Zhn on 14/02/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//
//  http://stackoverflow.com/a/26930606
//

#import "UIViewController+EmailSender.h"
#import <objc/runtime.h>
#import "AlertManager.h"

@implementation UIViewController (iKKEmailSend)

- (void)setMailer:(MFMailComposeViewController *)aMailer
{
    objc_setAssociatedObject(self, "mailer", aMailer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MFMailComposeViewController *)mailer
{
    return objc_getAssociatedObject(self, "mailer");
}

- (void) sendMailTo:(NSString*)recipient
            subject:(NSString*)subject
{
    
    if ([MFMailComposeViewController canSendMail])
    {
        self.mailer = [[MFMailComposeViewController alloc] init];
        self.mailer.navigationBar.translucent = NO;
        
        self.mailer.mailComposeDelegate = self;
        [self.mailer setSubject:subject];
        
        NSArray *toRecipients = [NSArray arrayWithObjects:recipient, nil];
        [self.mailer setToRecipients:toRecipients];
        
        [self.mailer setMessageBody:@"" isHTML:NO];
        
        [self presentViewController:self.mailer animated:YES completion:nil];
    }
    else {
        NSLog(@"This device cannot send email");
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error {
    if (error)
    {
        [[AlertManager shared] alertForError:error];
    }
    else
    {
        [self.mailer dismissViewControllerAnimated:YES completion:^{
            self.mailer = nil;
        }];
    }
}

@end