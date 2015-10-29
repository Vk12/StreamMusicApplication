//
//  Music.h
//  RokMobileFunProject
//
//  Created by Vala Kohnechi on 10/28/15.
//  Copyright © 2015 Vala Kohnechi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Music : NSObject
@property NSString *musicTitle;
@property NSString *musicArtist;
@property NSString *listenLink;
-(instancetype)initMusicWithDic:(NSDictionary *)dictionary;
@end
