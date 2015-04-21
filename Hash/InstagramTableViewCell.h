//
//  InstagramTableViewCell.h
//  Hash
//
//  Created by ASpple on 04/03/2015.
//  Copyright (c) 2015 NXB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstagramTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *postDate;

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *postTextLabel;
@end
