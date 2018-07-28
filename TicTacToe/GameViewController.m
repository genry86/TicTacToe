//
//  GameViewController.m
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *turnLabel;

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
    switch (sender.tag)
    {
        case TTCellPosLeftTop:
        {
            
        }
            break;
        case TTCellPosMiddleTop:
        {
            
        }
            break;
        case TTCellPosRightTop:
        {
            
        }
            break;
            
        case TTCellPosLeftMiddle:
        {
            
        }
            break;
        case TTCellPosCenter:
        {
            
        }
            break;
        case TTCellPosRightMiddle:
        {
            
        }
            break;
        
        case TTCellPosLeftBottom:
        {
            
        }
            break;
        case TTCellPosMiddleBottom:
        {
            
        }
            break;
        case TTCellPosRightBottom:
        {
            
        }
            break;
    }
    
    self.turnLabel.text = [NSString stringWithFormat:@"%@'s turn", AppState.sharedInstance.currentSymbol];
}

@end
