//
//  Music.m
//  RokMobileFunProject
//
//  Created by Rostin Kohnechi on 10/28/15.
//  Copyright © 2015 Vala Kohnechi. All rights reserved.
//

#import "Music.h"

@implementation Music

-(instancetype)initMusicWithDic:(NSDictionary *)dictionary {
    
    self = [super init];
    
    self.musicTitle = dictionary[@"title"];
    
    self.musicTitle = dictionary[@"artist"];
    
    return self;
}
@end
