//
//  RokMusicPlayer.h
//  RokMobileFunProject
//
//  Created by Vala Kohnechi on 10/28/15.
//  Copyright © 2015 Vala Kohnechi. All rights reserved.
//
//"http://www.radiobrasov.ro/listen.m3u"
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "SelectMusicViewController.h"
static NSString * const MusicURLString = @"https:freemusicarchive.org/music/listen/dc8e2b035082918898816fa2da09ccfcd56f998e";


@interface RokMusicPlayer : NSObject <SelectMusicDelegate>
@property BOOL isPlaying;
@property AVPlayer *player;
@property NSString *selectedSong;
@property SelectMusicViewController *selectMusicViewController;
+ (RokMusicPlayer *)sharedCenter;   // class method to return the singleton object

- (void)playMusicWithString:(NSString *)selectedSongUrl;
- (void)pauseMusic;
- (void)toggleMusic;
- (BOOL)currentlyPlayingMusic;
@end
