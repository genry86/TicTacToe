//
//  ViewController.m
//  TicTacToe
//
//  Created by Genry on 7/27/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    AppState.sharedInstance.currentSymbol = [segue.identifier isEqualToString:@"StartAsXSegue"] ? kBoardXCell : kBoardOCell;
}
@end
