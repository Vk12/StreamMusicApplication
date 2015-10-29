//
//  ViewController.h
//  RokMobileFunProject
//
//  Created by Vala Kohnechi on 10/28/15.
//  Copyright © 2015 Vala Kohnechi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@protocol SelectMusicDelegate <NSObject>
- (void) newSongSelected:(NSString *)songSelected;
@end

@interface SelectMusicViewController : UIViewController
@property (nonatomic, weak) id <SelectMusicDelegate> delegate;
@property AVPlayer *player;
@end

