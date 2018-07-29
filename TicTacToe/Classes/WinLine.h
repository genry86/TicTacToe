//
//  WinLine.h
//  TicTacToe
//
//  Created by Genry on 7/28/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WinLine : NSObject
@property(nonatomic, strong) NSNumber *row1;
@property(nonatomic, strong) NSNumber *col1;
@property(nonatomic, strong) NSNumber *row2;
@property(nonatomic, strong) NSNumber *col2;

- (instancetype)initWithFirstPoint:(CGPoint)firstPoint andSecondPoint:(CGPoint)secondPoint;
 
@end
