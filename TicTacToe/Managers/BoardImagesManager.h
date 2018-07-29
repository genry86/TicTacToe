//
//  BoardImagesManager.h
//  TicTacToe
//
//  Created by Genry on 7/29/18.
//  Copyright © 2018 Genry. All rights reserved.
//

/**
 `BoardImagesManager` class-manager for images on the boards
 */

@interface BoardImagesManager : NSObject

/**
 geting singleton, for convenient work with board
 */
+ (BoardImagesManager *)sharedInstance;

/**
  cache for board images fullfiled from internet or from local assets
 */
@property (nonatomic, strong) NSMutableDictionary *marks;

/**
 * `downloadBoardImagesWithBlock:completionBlock` downloading data in background thread and saves it to `marks` cache
 * @param completionBlock
 * block which will be executed in main thread when images installed
 */
- (void)downloadBoardImagesWithBlock:(CompletionBlock)completionBlock;

@end
