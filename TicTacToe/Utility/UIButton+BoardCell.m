//
//  UIButton+BoardCell.m
//  TicTacToe
//
//  Created by Genry on 7/29/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import "UIButton+BoardCell.h"

@implementation UIButton (BoardCell)

- (CGPoint)getCellCoords
{
    NSString *cellIndexes = @(self.tag).stringValue;
    NSInteger row = [cellIndexes substringWithRange:NSMakeRange(0, 1)].integerValue;
    NSInteger col = [cellIndexes substringWithRange:NSMakeRange(1, 1)].integerValue;
    
    return CGPointMake(col, row);
}

- (void)setImageBySymbol:(NSString *)symbol
{
    UIImage *image = [BoardImagesManager.sharedInstance.marks[symbol] copy];
    [self setImage:image forState:UIControlStateNormal];
}
@end
