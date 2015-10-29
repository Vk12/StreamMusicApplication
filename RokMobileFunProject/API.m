//
//  API.m
//  RokMobileFunProject
//
//  Created by Vala Kohnechi on 10/29/15.
//  Copyright © 2015 Vala Kohnechi. All rights reserved.
//

#import "API.h"
#import "AFNetworking.h"
#import "Music.h"

static NSString * const BaseURLString = @"https://freemusicarchive.org/recent.json";
@implementation API
static API *sharedAPICenter = nil;

@synthesize delegate;

// Setting the delegate
- (void) musicArrayReady:(NSMutableArray *)musicArray {
    [self.delegate musicArrayReady:musicArray];

}

// Creating a shared singleton object
+ (API *)sharedCenter {
    if (sharedAPICenter == nil) {
        sharedAPICenter = [[super allocWithZone:NULL] init];
    }
    return sharedAPICenter;
}

// Init the singleton
- (id)init {
    if ( (self = [super init]) ) {
        [self getMusicFromServer];
    }
    return self;
}

// Retrieve music from server
-(void)getMusicFromServer {
        
        NSURL *url = [NSURL URLWithString:BaseURLString];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFJSONResponseSerializer serializer];
        
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            // Get json response
            
            NSDictionary *music = (NSDictionary *)responseObject[@"aTracks"];
            
//            NSLog(@"%@",music);
            
            NSMutableArray *musicArray = [[NSMutableArray alloc]init];
            
            
            for (NSDictionary *dict in music) {
                Music *music = [[Music alloc]initMusicWithDic:dict];
                [musicArray addObject:music];
                [self.delegate musicArrayReady:musicArray];
                NSLog(@"%@",musicArray);
            }
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            // Prints error message if failed to retrieve JSON from server
            NSLog(@"%@",error);
        }];
        
        [operation start];
}

@end
