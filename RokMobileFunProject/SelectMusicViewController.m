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
@property Music *music;
@property NSString *selectedSong;
@end

@implementation SelectMusicViewController
@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Fetch data from server
    [self getMusicFromServer];
    
    // Set Delegate to self
    self.sharedAPIManager.delegate = self;
    // Initalizes Singleton
    self.sharedManager = [RokMusicPlayer sharedCenter];
}

- (void) newSongSelected:(NSString *)songSelected {
    [self newSongSelected:songSelected];
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
    [self.sharedManager playMusicWithString:self.selectedSong];
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
    
    self.music = self.arrayOfMusic[indexPath.row];
    cell.titleLabel.text = self.music.musicTitle;
    cell.artistLabel.text = self.music.musicArtist;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfMusic.count;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //TODO: Depending on song, segue to music vc
    self.music = self.arrayOfMusic[indexPath.row];
    self.selectedSong = [NSString stringWithFormat:@"%@",self.music.listenLink];
    NSLog(@"%@",self.selectedSong);
    [self.delegate newSongSelected:self.selectedSong];
    
}



@end
