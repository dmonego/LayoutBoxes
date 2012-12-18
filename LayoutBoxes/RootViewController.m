//
//  RootViewController.m
//  LayoutBoxes
//
//  Created by Daniel Monego on 12/17/12.
//  Copyright 2012 CDM. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController
/*
 
 
 +--+
 | 1|
 +--+
 +--+
 | 2|
 |  |
 +--+
 +--------+
 |     3  |
 +--------+
 +--------+
 |        |
 |   4    |
 |        |
 |        |
 +--------+
 
 
 Arrange as:
 1 3
 2 4
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    VBoxView *outerView = [[VBoxView alloc] init];
    outerView.gap = 5;
    HBoxView *innerViewTop = [[HBoxView alloc] init];
    innerViewTop.gap = 5;
    HBoxView *innerViewBottom = [[HBoxView alloc] init];
    innerViewBottom.gap = 5;
    
    UIImageView *kitten1 = [self getImageViewWithImageNamed:@"80-60"];
    [innerViewTop addSubview:kitten1];
    UIImageView *kitten2 = [self getImageViewWithImageNamed:@"80-120"];
    [innerViewBottom addSubview:kitten2];
    UIImageView *kitten3 = [self getImageViewWithImageNamed:@"160-60"];
    [innerViewTop addSubview:kitten3];
    UIImageView *kitten4 = [self getImageViewWithImageNamed:@"160-120"];
    [innerViewBottom addSubview:kitten4];
    
    [outerView addSubview:innerViewTop];
    [outerView addSubview:innerViewBottom];
    
    [self.view addSubview:outerView];

}

-(UIImageView *)getImageViewWithImageNamed:(NSString *)imageName
{
    return  [[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]] autorelease];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell.
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
	*/
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

@end
