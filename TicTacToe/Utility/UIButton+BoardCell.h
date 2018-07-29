//
//  UIButton+BoardCell.h
//  TicTacToe
//
//  Created by Genry on 7/29/18.
//  Copyright © 2018 Genry. All rights reserved.
//

/**
 `BoardCell` category adding utility method of fetching table-coords from pressed button
 */

@interface UIButton (BoardCell)

/**
  fetching CGPoint struct with pressed cell-coords
 */
- (CGPoint)getCellCoords;

- (void)setImageBySymbol:(NSString *)symbol;
@end