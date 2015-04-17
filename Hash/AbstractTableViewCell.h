//
//  AbstractTableViewCell.h
//  Sooma
//
//  Created by Yasir Ali on 10/6/10.
//  Copyright 2010 THE BRAINS Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCellBackgroundView.h"


@interface AbstractTableViewCell : UITableViewCell {
	UIColor *selectedBackgroundColor;
	Object *object;
	NSInteger height;
}

@property (nonatomic, retain) UIColor *selectedBackgroundColor;
@property (nonatomic, retain) Object *object;
@property (nonatomic, assign) NSInteger height;

- (void)setPosition:(CellPosition)position;


@end
