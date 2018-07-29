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
#import "UIButton+BoardCell.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *turnLabel;
@property (weak, nonatomic) IBOutlet WinView *winView;

@end

@implementation GameViewController

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.turnLabel.text = [NSString stringWithFormat:@"%@'s turn", AppState.sharedInstance.currentSymbol];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (IBAction)tapCell:(UIButton *)sender
{
    if (sender.imageView.image) {
        return;
    }
    [self setMarkForButton:sender];

    WinLine *winLine;
    NSString *currentSymbol = [GameBoard.sharedInstance tapOnRow:sender.getCellCoords.y
                                                       andColumn:sender.getCellCoords.x
                                                         winLine:&winLine];
    
    switch ([self getStatus:winLine])
    {
        case StepStatusNextTurn:
        {
            self.turnLabel.text = [NSString stringWithFormat:@"%@'s turn", currentSymbol];
        }
            break;
            
        case StepStatusNoEmptyCells:
        {
            [self presentAlertWithMessage:@"A drow"];
        }
            break;
            
        case StepStatusWin:
        {
            [self.winView drawLine:winLine];
            [self presentAlertWithMessage:[NSString stringWithFormat:@"%@ wins", currentSymbol]];
        }
            break;
    }
}

- (StepStatus)getStatus:(WinLine *)winLine
{
    if (!winLine && GameBoard.sharedInstance.checkAbilityToTap) {
        return StepStatusNextTurn;
    }
    else if (!winLine && !GameBoard.sharedInstance.checkAbilityToTap) {
        return StepStatusNoEmptyCells;
    }
    else {
        return StepStatusWin;
    }
}

- (void)setMarkForButton:(UIButton *)button
{
    [button setImage:[UIImage imageNamed:AppState.sharedInstance.currentSymbol] forState:UIControlStateNormal];
}

- (void)presentAlertWithMessage:(NSString *)message
{
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)),
                   dispatch_get_main_queue(),
    ^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                                 message:message
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Ok"
                                                            style:UIAlertActionStyleDestructive
                                                          handler:^(UIAlertAction *action)
                                    {
                                        [AppState.sharedInstance reset];
                                        [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                                    }]];
        
        [weakSelf presentViewController:alertController animated:YES completion:nil];
    });
}

@end
