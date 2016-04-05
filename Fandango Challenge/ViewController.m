//
//  ViewController.m
//  Fandango Challenge
//
//  Created by Belén Molina del Campo on 05/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray *filmsArray;
@property (strong, nonatomic) NSMutableData *xmlData;
@property (strong, nonatomic) NSURLSession *connectionInProgress;
- (void)loadFilms;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.filmsArray = [[NSMutableArray alloc] initWithCapacity:0];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.filmsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"filmCell"];
    NSUInteger row = indexPath.row;
    NSString *titleString = self.filmsArray[row];
    cell.textLabel.text = titleString;
    cell.textLabel.font = [UIFont systemFontOfSize:10.0];
    cell.textLabel.textColor = [UIColor colorWithRed:0.75 green:0.17 blue:0.64 alpha:1];
    return cell;
}

- (void)loadFilms
{
    [self.filmsArray removeAllObjects];
    [[self tableView] reloadData];
    
    NSURL *ourUrl = [NSURL URLWithString:@"http://www.fandango.com/rss/newmovies.rss"];
//    NSURLRequest *ourRequest = [NSURLRequest requestWithURL:ourUrl cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
    
    self.xmlData = [[NSMutableData alloc] init];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:ourUrl completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              NSLog(@"%@", data);
                                          }];}

@end
