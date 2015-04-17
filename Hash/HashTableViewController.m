//
//  HashTableViewController.m
//  Hash
//
//  Created by Faiz Rasool on 03/03/2015.
//  Copyright (c) 2015 NXB. All rights reserved.
//

#import "HashTableViewController.h"
#import "TwitterTableViewCell.h"
#import "STTwitter.h"
#import <Accounts/Accounts.h>
#import "UIImageView+AFNetworking.h"
#import "Tweet.h"
#import "NSMutableArray+Shuffled.h"
#import "SVProgressHUD.h"
#import "SBInstagramController.h"
#import "InstagramTableViewCell.h"
#import "SVWebViewController.h"

@interface HashTableViewController ()

@property (nonatomic, strong) STTwitterAPI *twitter;
@property (nonatomic, strong) NSMutableArray * feedItems;

@property SBInstagramController *instagramController;

@property BOOL downloading;

@property (nonatomic, strong) NSArray * likers;

@end

@implementation HashTableViewController

- (void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self setup];
}

- (instancetype)initWithStyle:(UITableViewStyle)style{
    
    self = [super initWithStyle:style];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void) reload{
    [self.refreshControl beginRefreshing];
    // refresh code goes here
    self.feedItems = [[NSMutableArray alloc]init];
    [self authenticateTwitterWithOutCredentials];
    [self getInstagramFeed];
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

- (void) setup{
    
    self.title = @"Hash";
    
    UIRefreshControl * control = [[UIRefreshControl alloc]init];//WithFrame:CGRectMake(0, 0, 40, 40)];
    [control addTarget:self action:@selector(reload) forControlEvents:UIControlEventValueChanged];
    [self setRefreshControl:control];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TwitterTableViewCell" bundle:nil] forCellReuseIdentifier:@"TwitterCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"InstagramTableViewCell" bundle:nil] forCellReuseIdentifier:@"instagramCell"];
    
    self.feedItems = [[NSMutableArray alloc]init];
    [self authenticateTwitterWithOutCredentials];
    [self getInstagramFeed];
}


-(void) authenticateTwitterWithOutCredentials{
    
    NSString *screenName= [kSearchTag substringFromIndex:1];
    _twitter= [STTwitterAPI twitterAPIAppOnlyWithConsumerKey:kTwitterConsumerKey consumerSecret:kTwitterConsumerSecret];
    
    [SVProgressHUD showWithStatus:@"Loading.."];
    
    [_twitter verifyCredentialsWithSuccessBlock:^(NSString* auth){
        
        [_twitter getUserTimelineWithScreenName:screenName successBlock:^(NSArray *data) {
            
            __weak typeof(self) weakSelf = self;
            [weakSelf.feedItems addObjectsFromArray:data];
            [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
            [SVProgressHUD dismiss];
            
            
        } errorBlock:^(NSError *error) {
            [SVProgressHUD dismiss];
        }];
        
    }errorBlock:^(NSError *error)  {
        NSLog(@"Error in auth %@",error.localizedDescription);
        [SVProgressHUD dismiss];
        
    }];
}


- (void) getInstagramFeed{
    
    self.instagramController = [SBInstagramController dataSource];
    
    //setting up, data were taken from instagram app setting (www.instagram.com/developer)
    self.instagramController.instagramRedirectUri = kInstagramRedirectUri;
    self.instagramController.instagramClientSecret = kInstagramClientSecret;
    self.instagramController.instagramClientId = kInstagramClientId;
    self.instagramController.instagramDefaultAccessToken = kInstagramClientDefaultToken;
    self.instagramController.instagramMultipleUsersId = @[@"6874212"];
    self.instagramController.instagramMultipleTags = @[[kSearchTag substringFromIndex:1]];
    
    [self.instagramController mediaMultiplesWithComplete:^(NSArray *mediaArray, NSArray *lastMedia, NSError *error) {
        if (!error) {
            [self.feedItems addObjectsFromArray:mediaArray];
            
            //shuffle objects
            //self.feedItems = [self.feedItems shuffled];

            [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
        }else{
            NSLog(@"error: %@", error.localizedDescription);
        }
        
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.feedItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row < self.feedItems.count)
    {
        
        id item = self.feedItems[indexPath.row];
        
        if([item isKindOfClass:[SBInstagramMediaPagingEntity class]])
        {
            
            InstagramTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"instagramCell" forIndexPath:indexPath];
            
            SBInstagramMediaEntity *entity = ((SBInstagramMediaPagingEntity *)self.feedItems[indexPath.row]).mediaEntity;
            
            SBInstagramImageEntity *imageEntity = entity.images[SBInstagramImageStandardResolutionKey];
            
            [cell.userImageView setImageWithURL:[NSURL URLWithString:entity.profilePicture] placeholderImage:[UIImage imageNamed:@"egopv_photo_placeholder.png"]];
            [cell.postImageView setImageWithURL:[NSURL URLWithString:imageEntity.url] placeholderImage:[UIImage imageNamed:@"egopv_photo_placeholder.png"]];
            cell.usernameLabel.text = entity.userName;
            cell.postTextLabel.text = entity.caption ?: @"";
            
            return cell;
        }
        else
        {
            TwitterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TwitterCell" forIndexPath:indexPath];
            Tweet * tweet = [[Tweet alloc] initWithDictionary:self.feedItems[indexPath.row]];
            [cell setTweet:tweet];
            return cell;
        }
    }
    
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    NSString *feedId= [[self.feedItems objectAtIndex:indexPath.row] objectForKey:@"id_str"];
    //    NSString *screenName=[[self.feedItems objectAtIndex:indexPath.row] objectForKey:@"screen_name"];
    //    NSString *hostUrl=@"https://twitter.com/";
    //    NSString *url= [NSString stringWithFormat:@"%@%@%@",hostUrl,screenName,feedId];
    
    
    
    id object = self.feedItems[indexPath.row];
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        
        NSString* url = object[@"user"][@"url"];
        
        SVWebViewController *webViewController = [[SVWebViewController alloc] initWithAddress:url];
        [self.navigationController pushViewController:webViewController animated:YES];
        
    }
}


@end
