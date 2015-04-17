//
//  SubItemTableViewCell.h
//  CPW
//
//  Created by Yasir Ali on 12/10/10.
//  Copyright 2010 THE BRAINS (Pvt.) Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemTableViewCell.h"
#import "ImageView.h"
#import <QuartzCore/QuartzCore.h>


@interface SubItemTableViewCell : ItemTableViewCell <ImageViewDelegate>	{

}

@property (nonatomic, retain) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, retain) IBOutlet UILabel *subDescriptionLabel;
//@property (nonatomic, retain) IBOutlet UIButton *cellButton;

@end
