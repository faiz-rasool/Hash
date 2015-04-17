//
//  TableView.h
//  CPW
//
//  Created by Yasir Ali on 12/9/10.
//  Copyright 2010 THE BRAINS (Pvt.) Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MutableDictionary.h"
@protocol TableViewDelegate

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface TableView : View <UITableViewDataSource, UITableViewDelegate>	{
	IBOutlet UITableView *tableView;
	MutableDictionary *source;
	id <TableViewDelegate> delegate;
}
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) MutableDictionary *source;
@property (nonatomic, assign) id <TableViewDelegate> delegate;


- (void)reload;
@end
