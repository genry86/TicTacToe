//
//  StartViewController.m
//  TicTacToe
//
//  Created by Genry on 7/27/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *startXButton;
@property (weak, nonatomic) IBOutlet UIButton *startYButton;
@end

@implementation StartViewController

#pragma mark - View Controller lifecycle
#pragma mark -

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:UIButton.class]) {
        AppState.sharedInstance.currentSymbol = [sender tag] ? kBoardXCell : kBoardOCell;   // 1 - X, 0 - O
    }
}

#pragma mark - Public
#pragma mark -

- (void)enableUI
{
    [self.activityIndicator stopAnimating];
    self.startXButton.enabled = YES;
    self.startYButton.enabled = YES;
}
@end
