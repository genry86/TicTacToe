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
#import "ShareApiUtility.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *turnLabel;
@property (weak, nonatomic) IBOutlet WinView *winView;

@end

@implementation GameViewController

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self loadStateAndFillBoard];
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
                                        [AppState removeState];
                                        [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                                    }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"Share"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action)
                                    {
                                        [ShareApiUtility sendMessage:message inController:weakSelf];
                                    }]];
        
        
        [weakSelf presentViewController:alertController animated:YES completion:nil];
    });
}

- (void)loadStateAndFillBoard
{
    [AppState.sharedInstance.board enumerateObjectsUsingBlock:^(NSMutableArray<NSString *> *row, NSUInteger rowIndex, BOOL *stop)
     {
         [row enumerateObjectsUsingBlock:^(NSString *symbol, NSUInteger columnIndex, BOOL *stop)
          {
              NSInteger tag = [NSString stringWithFormat:@"%lu%lu", (unsigned long)rowIndex + 1, (unsigned long)columnIndex + 1].integerValue;
              UIButton *buttonCell = [self.view viewWithTag:tag];
              
              if (buttonCell && [buttonCell isKindOfClass:UIButton.class] && ![symbol isEqualToString:@"_"]) {
                  [buttonCell setImage:[UIImage imageNamed:symbol] forState:UIControlStateNormal];
              }
          }];
     }];
}
@end
