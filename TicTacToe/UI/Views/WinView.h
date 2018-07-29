//
//  WinView.h
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

@class WinLine;

/**
 `WinView` UIView class for drawing crossed line if someone win
 */

@interface WinView : UIView

/**
 * `drawLine:winLine` drawing cross line on three cells
 * @param winLine
 * crossed line objects with coords
 */
- (void)drawLine:(WinLine *)winLine;

@end
