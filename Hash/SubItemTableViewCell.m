//
//  SubItemTableViewCell.m
//  CPW
//
//  Created by Yasir Ali on 12/10/10.
//  Copyright 2010 THE BRAINS (Pvt.) Ltd. All rights reserved.
//

#import "SubItemTableViewCell.h"
#import "SubItem.h"

@implementation SubItemTableViewCell
@synthesize descriptionLabel, subDescriptionLabel;

- (void)awakeFromNib	{
	[super awakeFromNib];

}

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


- (void)imageChanged	{
	[super imageChanged];
	self.textLabel.frame = (super.imageView.image == nil) ? CGRectMake(5, 5, 287, self.textLabel.frame.size.height) : CGRectMake(5, 5, 208, self.textLabel.frame.size.height);
	descriptionLabel.frame = (super.imageView.image == nil) ? CGRectMake(5, self.textLabel.frame.size.height + 10, 287, self.textLabel.frame.size.height) : CGRectMake(5, self.textLabel.frame.size.height + 10, 208, self.textLabel.frame.size.height);
	
	//self.textLabel.backgroundColor = [UIColor redColor];
	//descriptionLabel.backgroundColor = [UIColor blueColor];
//	super.imageView.hidden = (super.imageView.image == nil);
	
//	descriptionTextView.frame = (super.imageView.image == nil) ? CGRectMake(7, 5, 287, descriptionTextView.frame.size.height - 10) : CGRectMake(55, 5, 239, descriptionTextViews.frame.size.height - 10);
}

#pragma mark -
#pragma mark Properties

- (void)setObject:(SubItem *)subItem	{
	[super setObject:subItem];
	descriptionLabel.text = subItem.description;
	self.textLabel.frame = subItem.nameFrame;
	self.textLabel.font = [UIFont boldSystemFontOfSize:17];
	self.descriptionLabel.frame = subItem.descriptionFrame;
//	self.title.frame = subItem.nameFrame;
	subDescriptionLabel.text = subItem.subDescription;
	self.subDescriptionLabel.frame = subItem.subDescriptionFrame;
	self.imageView.layer.masksToBounds = YES;
	self.imageView.layer.cornerRadius = 10;


}

- (Object *)object	{
	return [super object];
}

@end
