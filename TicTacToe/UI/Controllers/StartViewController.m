//
//  StartViewController.m
//  TicTacToe
//
//  Created by Genry on 7/27/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import "StartViewController.h"
@import GoogleMobileAds;

@interface StartViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *startXButton;
@property (weak, nonatomic) IBOutlet UIButton *startYButton;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;
@end

@implementation StartViewController

#pragma mark - View Controller lifecycle
#pragma mark -

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
}

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
