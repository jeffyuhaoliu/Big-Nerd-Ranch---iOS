//
//  BNRListViewController.m
//  Nerdfeed
//
//  Created by Jeff Y Liu on 9/26/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNRListViewController.h"
#import "BNRWebViewController.h"
#import "BNRRSSFeed.h"
#import "BNRRSSItem.h"

@interface BNRListViewController() <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableData *jsonData;
@property (nonatomic, strong) BNRRSSFeed *feed;

@end

@implementation BNRListViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 0;
    return [self.feed.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return nil;
    UITableViewCell *c = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    BNRRSSFeed *i = self.feed.items[indexPath.row];
    c.textLabel.text = i.title;
    
    return c;
}

- (void)fetchFeed {
    self.jsonData = [[NSMutableData alloc] init];
    
    NSString *requestString = @"http://itunes.apple.com/us/rss/topsongs/limit=10/json";
    NSURL *url = [NSURL URLWithString:requestString];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    self.connection = [[NSURLConnection alloc] initWithRequest:req delegate:self startImmediately:YES];
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"Top 10 Songs";
        [self fetchFeed];
    }
    return self;
}

// This method will be called several times as the data arrives
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Add the incoming chunk of data to the container we are keeping
    // THis data always comes in the correct order
    [self.jsonData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
//    // We are just checking to make sure we are getting the JSON
//    NSString *jsonCheck = [[NSString alloc] initWithData:self.jsonData encoding:NSUTF8StringEncoding];
//    
//    NSLog(@"%@", jsonCheck);
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:[self jsonData]
                                                               options:0
                                                                 error:nil];
    NSLog(@"%@", jsonObject);
    
    BNRRSSFeed *c = [[BNRRSSFeed alloc] init];
    [c readFromJSONObject:jsonObject];
    self.feed = c;
    
    NSLog(@"%@", self.feed.title);
    
    [self.tableView reloadData];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // Clear out any of the objects we were using to perform the requesst
    self.connection = nil;
    self.jsonData = nil;
    
    // Get the description of the error and alert the user
    NSString *errString = [error localizedDescription];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error"
                                                 message:errString
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [av show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BNRRSSItem *i = self.feed.items[indexPath.row];
    self.webViewController.link = i.link;
    self.webViewController.title = i.title;
    [self.navigationController pushViewController:self.webViewController animated:YES];
}

@end
