//
//  ShareApiUtility.m
//  TicTacToe
//
//  Created by Genry on 7/29/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import "ShareApiUtility.h"

@implementation ShareApiUtility

+ (ShareApiUtility *)sharedInstance
{
    static ShareApiUtility *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ShareApiUtility alloc] init];
    });
    return instance;
}

- (void)sendMessage:(NSString *)message inController:(UIViewController *)sourceController
{
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:@[message]
                                                                                     applicationActivities:nil];
    activityController.modalPresentationStyle = UIModalPresentationPopover;
    
    UIPopoverPresentationController *popController = activityController.popoverPresentationController;
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = sourceController.navigationItem.leftBarButtonItem;
    popController.sourceView = sourceController.view.superview;
    
    [sourceController presentViewController:activityController animated:YES completion:nil];
}

@end
