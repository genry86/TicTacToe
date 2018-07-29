//
//  WinView.h
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WinLine;

@interface WinView : UIView

- (void)drawLine:(WinLine *)winLine;

@end
