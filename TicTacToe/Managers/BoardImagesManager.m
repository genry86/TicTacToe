//
//  BoardImagesManager.m
//  TicTacToe
//
//  Created by Genry on 7/29/18.
//  Copyright © 2018 Genry. All rights reserved.
//

#import "BoardImagesManager.h"

@implementation BoardImagesManager

+ (BoardImagesManager *)sharedInstance
{
    static BoardImagesManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[BoardImagesManager alloc] init];
    });
    return instance;
}

#pragma mark - Public
#pragma mark -

- (NSMutableDictionary *)marks
{
    if (!_marks) {
        _marks = NSMutableDictionary.new;
    }
    return _marks;
}

- (void)downloadBoardImagesWithBlock:(CompletionBlock)completionBlock
{
    __weak typeof(self) weakSelf = self;
    CompletionBlock block = [completionBlock copy];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^{
                       UIImage *xImage = [weakSelf downloadImageByURL:kXImageUrl];
                       UIImage *oImage = [weakSelf downloadImageByURL:kOImageUrl];
                       
                       weakSelf.marks[kBoardXCell] = xImage ?: [UIImage imageNamed:kBoardXCell];
                       weakSelf.marks[kBoardOCell] = oImage ?: [UIImage imageNamed:kBoardOCell];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^{
                                          if (block) {
                                              block();
                                          }
                                      });
                   });
}

#pragma mark - Private
#pragma mark -

- (UIImage *)downloadImageByURL:(NSString *)fileURL
{
    NSURL *url = [NSURL URLWithString:fileURL];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    return [UIImage imageWithData:imageData];
}

@end
