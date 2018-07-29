//
//  StartViewController.m
//  TicTacToe
//
//  Created by Genry on 7/27/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import "StartViewController.h"

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

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
    AppState.sharedInstance.currentSymbol = [segue.identifier isEqualToString:@"StartAsXSegue"] ? kBoardXCell : kBoardOCell;
}
@end
