//
//  GameViewController.m
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import "GameViewController.h"
#import "WinView.h"
#import "WinLine.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *turnLabel;
@property (weak, nonatomic) IBOutlet WinView *winView;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)tapCell:(UIButton *)sender
{
    NSString *cellIndexes = @(sender.tag).stringValue;
    NSInteger row = [cellIndexes substringFromIndex:0].integerValue;
    NSInteger col = [cellIndexes substringFromIndex:1].integerValue;
    
    WinLine *winLine;
    [GameBoard.sharedInstance tapOnRow:row andColumn:col winLine:&winLine];
    
    if (!winLine && GameBoard.sharedInstance.checkAbilityToTap) {
        self.turnLabel.text = [NSString stringWithFormat:@"%@'s turn", AppState.sharedInstance.currentSymbol];
    }
    else if (!winLine && !GameBoard.sharedInstance.checkAbilityToTap) {
        
    }
    else {
        [self.winView drawLine:winLine];
    }
}

@end
