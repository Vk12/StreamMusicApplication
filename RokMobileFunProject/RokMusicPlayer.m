//
//  RokMusicPlayer.m
//  RokMobileFunProject
//
//  Created by Vala Kohnechi on 10/28/15.
//  Copyright © 2015 Vala Kohnechi. All rights reserved.
//

#import "RokMusicPlayer.h"


@implementation RokMusicPlayer 

static RokMusicPlayer *sharedMusicCenter = nil;

+ (RokMusicPlayer *)sharedCenter {
    if (sharedMusicCenter == nil) {
        sharedMusicCenter = [[super allocWithZone:NULL] init];
    }
    return sharedMusicCenter;
}

// Init the singleton
- (id)init {
    if ( (self = [super init]) ) {
        self.isPlaying = NO;
        self.selectMusicViewController.delegate = self;
        
    }
    return self;
}

- (void)newSongSelected:(NSString *)songSelected {

    self.selectedSong = songSelected;
    [self playMusicWithString:self.selectedSong];
}

// Plays music on the player
- (void)playMusicWithString:(NSString *)selectedSongUrl {
    [_player pause];
    NSURL *streamingURL = [NSURL URLWithString:selectedSongUrl];
    _player = [AVPlayer playerWithURL:streamingURL];
    [_player play];
    self.isPlaying = YES;
}

// Pauses music on the player
- (void)pauseMusic {
    [self.player pause];
    self.isPlaying = NO;
}

// Toggles music on or off
- (void)toggleMusic {
    if (self.isPlaying == YES) {
        [self pauseMusic];
    } else {
        [self playMusicWithString:nil];
    }
}

// Checks to see if music is currently playing
- (BOOL)currentlyPlayingMusic {
    return [self isPlaying];
}


@end
