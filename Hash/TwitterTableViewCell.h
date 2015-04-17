//
//  TwitterTableViewCell.h
//  Hoot
//
//  Created by Faiz Rasool on 24/02/2015.
//  Copyright (c) 2015 NXB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tweet;
@interface TwitterTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *postLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userThumbnail;
@property (weak, nonatomic) IBOutlet UILabel *username;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageTopConstraint;

@property (strong, nonatomic) Tweet * tweet;

@end
