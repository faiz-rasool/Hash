//
//  NewsViewController.m
//  CPW
//
//  Created by Qasim Shah on 1/14/11.
//  Copyright 2011 THE BRAINS Pvt. Ltd. All rights reserved.
//

#import "NewsViewController.h"
#import "Cell.h"
#import "SubItem.h"
#import "CPWAppDelegate.h"

@implementation NewsViewController

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

- (void)loadView {
	
	MutableDictionary *dictionary = [[[MutableDictionary alloc] init] autorelease];
	NSMutableArray *cells = [[[NSMutableArray alloc] init] autorelease];
	for (int i = 0; i < 10; i++) {
		Cell *cell = [[[Cell alloc] init] autorelease];
		
		
		cell.className = @"SubItemTableViewCell"; //: @"SubItemTableViewCell";
		
		SubItem *object;
		
		
		object = [[[SubItem alloc] init] autorelease];
		object.image = @"ios-tab-selected.png" ;
		object.name = [NSString stringWithFormat:@"Item %i News News News News", (i+1)];
		if (i %2 == 0)
			object.description = @"A quick brown fox jumps over the lazy dog.";
		
		
		object.subDescription = @"Subcategory News.";
		
		cell.object = object;
		[cells addObject:cell];
	}
	[dictionary setObject:cells forKey:@"Sub Items"];
	[super loadView];
	self.tableView.source = dictionary;
	[self.tableView reload];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
