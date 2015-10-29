//
//  API.h
//  RokMobileFunProject
//
//  Created by Vala Kohnechi on 10/29/15.
//  Copyright © 2015 Vala Kohnechi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class API;
// Set API Delegate
@protocol APIDelegate <NSObject>
- (void) musicArrayReady:(NSMutableArray *)musicArray;
@end
@interface API : NSObject

@property (nonatomic, weak) id <APIDelegate> delegate;
+ (API *)sharedCenter;
-(void)getMusicFromServer;
@end
