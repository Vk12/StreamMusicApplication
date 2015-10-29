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
#import "API.h"


// Set a static string for music
static NSString * const BaseURLString = @"https://freemusicarchive.org/recent.json";

@interface SelectMusicViewController () <UITableViewDataSource, UITableViewDelegate, APIDelegate>

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
@property API *sharedAPIManager;
@end

@implementation SelectMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Fetch data from server
    [self getMusicFromServer];
    
    // Set Delegate to self
    self.sharedAPIManager.delegate = self;
    // Initalizes Singleton
    self.sharedManager = [RokMusicPlayer sharedCenter];
}
////////////////////////////////////////
// MARK: Requesting JSON from server
////////////////////////////////////////

- (void)musicArrayReady:(NSMutableArray *)musicArray {
    self.arrayOfMusic = musicArray;
//    NSLog(@"%@",musicArray);
    [self.listMusicTableView reloadData];
}

- (void)getMusicFromServer {
    
    self.sharedAPIManager = [API sharedCenter];
}

// MARK: Music Play/Pause

// Toggles when button playButton pressed
- (IBAction)playButtonTapped:(UIButton *)sender {
    
    [self toggle];
}

// Toggles music on and off depending on state
-(void) toggle {
    
    if (self.sharedManager.currentlyPlayingMusic) {
        [self pauseMusic];
    } else {
        [self playMusic];
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

////////////////////////
//MARK: UITableview Delegates
////////////////////////

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ChooseMusicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"musicCell"];
    
    Music *music = self.arrayOfMusic[indexPath.row];
    cell.titleLabel.text = music.musicTitle;
    cell.artistLabel.text = music.musicArtist;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfMusic.count;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //TODO: Depending on song, segue to music vc
    
//    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"playMusicViewController"];
//    vc.theSong = self.arrayOfMusic[indexPath.row];
//    [self presentViewController:vc animated:true completion:nil];
    
}



@end
