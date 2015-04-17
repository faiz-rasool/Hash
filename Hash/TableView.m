//
//  TableView.m
//  CPW
//
//  Created by Yasir Ali on 12/9/10.
//  Copyright 2010 THE BRAINS (Pvt.) Ltd. All rights reserved.
//

#import "TableView.h"
#import "Cell.h"
#import "HeaderView.h"

@implementation TableView
@synthesize source, tableView, delegate;

- (void)awakeFromNib	{
	[super awakeFromNib];
	tableView.separatorStyle = UITableViewCellSelectionStyleNone;
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
	[source release];
    [super dealloc];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath	{
	//Cell *cell = [[source valueForKey:[[source allKeys] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
	Cell *cell = [[source valueForKey:[source keyAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
	NSLog(@"cell height: %i at indexPath (%i, %i)", cell.object.height, indexPath.section, indexPath.row);
	return cell.object.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath	{
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	[delegate didSelectRowAtIndexPath:indexPath];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section	{
	//return [[source valueForKey:[[source allKeys] objectAtIndex:section]] count];
	return [[source valueForKey:[source keyAtIndex:section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath	{
	//Cell *cell = [[source valueForKey:[[source allKeys] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
	Cell *cell = [[source valueForKey:[source keyAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
	NSString *CellIdentifier = [NSString stringWithFormat:@"%@CellIdentifier", cell.className];
	NSLog(@"%@", CellIdentifier);
	AbstractTableViewCell *tableViewCell = (AbstractTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (tableViewCell == nil)	{
		NSArray *array = [[NSBundle mainBundle] loadNibNamed:cell.className owner:self options:nil];
		tableViewCell = [array objectAtIndex:0];
		
	}
	tableViewCell.object = cell.object;
	return tableViewCell;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return [[source allKeys] count];
}
/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section	{
	//NSString *title = [[source allKeys] objectAtIndex:section];
	NSString *title = [source keyAtIndex:section];
	return [title isEqualToString:@"cells"] ? nil : title;
}*/
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section	{
	UIView *v;
	NSString *title = [source keyAtIndex:section];
	if ([title isEqualToString:@"cells"])	{
		return nil;
	}	else {
		HeaderView *headerView;
		NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
		headerView = (HeaderView *)[array objectAtIndex:0];
		headerView.title = title;
		v = headerView;
	}
	return v;
}

#pragma mark -
#pragma mark Methods

- (void)reload	{
	[self.tableView reloadData];
	[self hideActivityView];
}


@end
