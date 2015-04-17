//
//  AbstractTableViewCell.m
//  Sooma
//
//  Created by Yasir Ali on 10/6/10.
//  Copyright 2010 THE BRAINS Pvt. Ltd. All rights reserved.
//

#import "AbstractTableViewCell.h"


@implementation AbstractTableViewCell

@synthesize selectedBackgroundColor, height;

- (void)awakeFromNib	{
	self.selectedBackgroundColor = [UIColor colorWithRed:237.0/255 green:244.0/255 blue:213.0/255 alpha:1.0];
	self.height = 44;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code

		self.selectedBackgroundColor = [UIColor colorWithRed:237.0/255 green:244.0/255 blue:213.0/255 alpha:1.0];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}



- (void)setPosition:(CellPosition)position	{
	/*	// BACKGROUND VIEW
	CustomCellBackgroundView *bview = [[[CustomCellBackgroundView alloc] initWithFrame:CGRectZero] autorelease];
	bview.position = position;
	bview.fillColor = self.backgroundColor;
	bview.borderColor = [UIColor lightGrayColor];
	self.backgroundView = bview;
	*/
		// SELECTED BACKGROUND VIEW
	CustomCellBackgroundView *sview = [[[CustomCellBackgroundView alloc] initWithFrame:CGRectZero] autorelease];
	sview.position = position;
	sview.fillColor = self.selectedBackgroundColor;
	sview.borderColor = [UIColor lightGrayColor];
	self.selectedBackgroundView = sview;
}

- (void)setObject:(Object *)obj	{
	object = obj;
}

- (Object *)object	{
	return object;
}

@end
