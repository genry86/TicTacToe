//
//  WinLine.h
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

/**
 `WinLine` helper class to represent table-coordinates of start/end points of successfully crossed line
 */

@interface WinLine : NSObject

/**
  represents row of first cell of crossed line
 */
@property(nonatomic, strong) NSNumber *row1;
/**
  represents column of first cell of crossed line
 */
@property(nonatomic, strong) NSNumber *col1;
/**
  represents row of last cell of crossed line
 */
@property(nonatomic, strong) NSNumber *row2;
/**
  represents column of last cell of crossed line
 */
@property(nonatomic, strong) NSNumber *col2;

/**
 * `initWithFirstPoint:andSecondPoint` initialize method
 * @param firstPoint
 * CGPoint object used to initialize first point of crossed line
 * @param secondPoint
 * CGPoint object used to initialize last point of crossed line
 */
- (instancetype)initWithFirstPoint:(CGPoint)firstPoint andSecondPoint:(CGPoint)secondPoint;
 
@end
