//
//  ViewController.m
//  RokMobileFunProject
//
//  Created by Vala Kohnechi on 10/28/15.
//  Copyright © 2015 Vala Kohnechi. All rights reserved.
//

#import "SelectMusicViewController.h"
#import "AFNetworking.h"

static NSString * const BaseURLString = @"https://freemusicarchive.org/recent.json";

@interface SelectMusicViewController () <UITableViewDataSource, UITableViewDelegate>

///////////////////////////
//IBOUtlets
///////////////////////////

@property (weak, nonatomic) IBOutlet UITableView *listMusicTableView;


///////////////////////////
//Properites
//////////////////////////

@property NSMutableArray *music;

@end

@implementation SelectMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self getMusicFromServer];
}

- (void)getMusicFromServer {
    
    NSURL *url = [NSURL URLWithString:BaseURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // Get json response
        NSLog(@"%@", responseObject);
        
//        self.weather = (NSDictionary *)responseObject;
        
        // Set title of viewcontroller of music
        self.title = @"JSON Retrieved";
        
        // Reloads Tableview
        [self.listMusicTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // Prints error message if failed to retrieve JSON from server
        NSLog(@"%@",error);
    }];
    
    [operation start];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.music.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"MOzkhor"]) {
        
    }
}


@end
