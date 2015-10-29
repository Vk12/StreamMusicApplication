//
//  RokMusicPlayer.h
//  RokMobileFunProject
//
//  Created by Vala Kohnechi on 10/28/15.
//  Copyright © 2015 Vala Kohnechi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface RokMusicPlayer : NSObject
@property BOOL isPlaying;
@property AVPlayer *player;
+ (RokMusicPlayer *)sharedCenter;   // class method to return the singleton object

- (void)playMusic;
- (void)pauseMusic;
- (void)toggleMusic;
- (BOOL)currentlyPlayingMusic;
@end
