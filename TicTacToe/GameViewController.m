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
    [sender setImage:[UIImage imageNamed:AppState.sharedInstance.currentSymbol] forState:UIControlStateNormal];
    
    NSString *cellIndexes = @(sender.tag).stringValue;
    NSInteger row = [cellIndexes substringWithRange:NSMakeRange(0, 1)].integerValue;
    NSInteger col = [cellIndexes substringWithRange:NSMakeRange(1, 1)].integerValue;
    
    WinLine *winLine;
    NSString *currentSymbol = [GameBoard.sharedInstance tapOnRow:row andColumn:col winLine:&winLine];
    
    if (!winLine && GameBoard.sharedInstance.checkAbilityToTap) {
        self.turnLabel.text = [NSString stringWithFormat:@"%@'s turn", currentSymbol];
    }
    else if (!winLine && !GameBoard.sharedInstance.checkAbilityToTap) {
        [self presentAlertWithMessage:@"A drow"];
    }
    else {
        [self.winView drawLine:winLine];
        [self presentAlertWithMessage:[NSString stringWithFormat:@"%@ wins", currentSymbol]];
    }
}

- (void)presentAlertWithMessage:(NSString *)message
{
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)),
                   dispatch_get_main_queue(),
    ^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                                 message:message
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Ok"
                                                            style:UIAlertActionStyleDestructive
                                                          handler:^(UIAlertAction *action)
                                    {
                                        [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                                    }]];
        
        [weakSelf presentViewController:alertController animated:YES completion:nil];
    });
}

@end
