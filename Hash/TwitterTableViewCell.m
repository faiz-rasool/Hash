//
//  TwitterTableViewCell.m
//  Hoot
//
//  Created by Faiz Rasool on 24/02/2015.
//  Copyright (c) 2015 NXB. All rights reserved.
//

#import "TwitterTableViewCell.h"
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"

@implementation TwitterTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTweet:(Tweet *)tweet{
    self.postLabel.text = tweet.text;
    
    self.postDate.text= tweet.createdAt;
    [self.userThumbnail setImageWithURL:[NSURL URLWithString:tweet.profileImage]placeholderImage:[UIImage imageNamed:@"user_thumb.png"]];
    self.username.text = tweet.screenName;
    
}

-(NSString *)TimeIntervalOfPost:(NSString *)from{
    
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    NSString *TodayString = [NSString stringWithFormat:@"%@",[NSDate date]];
    NSTimeInterval time = [[df dateFromString:from] timeIntervalSinceDate:[ df dateFromString:TodayString]];
    
    int days = time / 60 / 60/ 24;
    NSString *TimeIntervalInDays= [NSString stringWithFormat:@"%d",days];
    return TimeIntervalInDays;
}

@end
