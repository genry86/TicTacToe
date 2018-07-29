//
//  StartViewController.m
//  TicTacToe
//
//  Created by Genry on 7/27/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import "StartViewController.h"

@implementation StartViewController

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:UIButton.class]) {
        AppState.sharedInstance.currentSymbol = [sender tag] ? kBoardXCell : kBoardOCell;   // 1 - X, 0 - O
    }
}
@end
