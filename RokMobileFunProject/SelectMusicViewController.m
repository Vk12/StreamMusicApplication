//
//  ViewController.m
//  RokMobileFunProject
//
//  Created by Vala Kohnechi on 10/28/15.
//  Copyright © 2015 Vala Kohnechi. All rights reserved.
//

#import "SelectMusicViewController.h"
#import "AFNetworking.h"
#import "Music.h"
#import "ChooseMusicTableViewCell.h"
#import "RokMusicPlayer.h"
// Set a static string for music
static NSString * const BaseURLString = @"https://freemusicarchive.org/recent.json";

@interface SelectMusicViewController () <UITableViewDataSource, UITableViewDelegate>

///////////////////////////
//IBOUtlets
///////////////////////////

@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UITableView *listMusicTableView;


///////////////////////////
//Properites
//////////////////////////

@property NSMutableArray *arrayOfMusic;
@property RokMusicPlayer *sharedManager;
@end

@implementation SelectMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSURL *streamingURL = [NSURL URLWithString:@"http://www.radiobrasov.ro/listen.m3u"];
//    NSLog(@"%@", streamingURL);
//    _player = [AVPlayer playerWithURL:streamingURL];
//    [_player play];
//    _player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
////    [self getMusicFromServer];
    
    self.sharedManager = [RokMusicPlayer sharedCenter];
}

// Receives JSON response from server
- (void)getMusicFromServer {
    
    NSURL *url = [NSURL URLWithString:BaseURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // Get json response
        
        NSDictionary *music = (NSDictionary *)responseObject;
        
        NSLog(@"%@",music);
        
//        NSMutableArray *resultsArray = [[NSMutableArray alloc]init];
//        resultsArray = responseObject;
        
//        for (NSDictionary *dict in music) {
//            Music *music = [[Music alloc]initMusicWithDic:dict];
//            [self.arrayOfMusic addObject:music];
//        }
//        
        // Set title of viewcontroller when JSON received
        self.title = @"JSON Retrieved";
        
        // Reloads Tableview
        [self.listMusicTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // Prints error message if failed to retrieve JSON from server
        NSLog(@"%@",error);
    }];
    
    [operation start];
    
}
- (IBAction)playButtonTapped:(UIButton *)sender {

    [self toggle];
}

-(void) toggle {
    
    if (self.sharedManager.currentlyPlayingMusic == YES) {
        [self playMusic];
    } else {
        [self pauseMusic];
    }
}

// Plays music and changes button's title to "Pause"
-(void) playMusic {
    [self.sharedManager playMusic];
    [self.playButton setTitle:@"Pause" forState:UIControlStateNormal];
}

// Pauses music and changes button's title to "Play"
-(void) pauseMusic {
    [self.sharedManager pauseMusic];
    [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ChooseMusicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    Music *music = self.arrayOfMusic[indexPath.row];
    cell.titleLabel.text = music.musicTitle;
    cell.titleLabel.text = music.musicArtist;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfMusic.count;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSString *streamingString = [NSString stringWithFormat:@"%@.json?client_id=fc886d005e29ba78f046e5474e3fdefb", [self.arrayOfMusic objectAtIndex:indexPath.row]];
  
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}


@end
