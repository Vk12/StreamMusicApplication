//
//  Music.m
//  RokMobileFunProject
//
//  Created by Vala Kohnechi on 10/28/15.
//  Copyright © 2015 Vala Kohnechi. All rights reserved.
//

#import "Music.h"

@implementation Music

-(instancetype)initMusicWithDic:(NSDictionary *)dictionary {
    
    self = [super init];
    
    self.musicTitle = dictionary[@"track_title"];
    
    self.musicArtist = dictionary[@"artist_name"];
    
    self.listenLink = dictionary[@"track_listen_url"];
    
    return self;
}
@end
