//
//  ShareApiUtility.h
//  TicTacToe
//
//  Created by Genry on 7/29/18.
//  Copyright © 2018 Genry. All rights reserved.
//

/**
 `ShareApiUtility` Utility class for sharing content between apps
 */

@interface ShareApiUtility : NSObject

/**
 geting singleton, for convenient work with board
 */
+ (ShareApiUtility *)sharedInstance;


/**
 * `sendMessage:inController` sharing data
 * @param message
 * string message wwhich would be shared
 * @param sourceController
 * controller from which activity sheet would be opened
 */
- (void)sendMessage:(NSString *)message inController:(UIViewController *)sourceController;

@end
