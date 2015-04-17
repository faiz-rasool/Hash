//
//  OnlyTextTableView.m
//  CPW
//
//  Created by Qasim Shah on 1/19/11.
//  Copyright 2011 THE BRAINS Pvt. Ltd. All rights reserved.
//

#import "OnlyTextTableView.h"


@implementation OnlyTextTableView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


@end
