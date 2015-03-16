//
//  ResultsTableViewController.m
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 3/9/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import "ResultsTableViewController.h"
#import "ResultsTableViewCell.h"


@interface ResultsTableViewController ()

@end



@implementation ResultsTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _mapItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"resultCell";
    ResultsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    long row = [indexPath row];
    
    MKMapItem *item = _mapItems[row];

    // Configure Cell
    UILabel *nameLabel = (UILabel *)[cell.contentView viewWithTag:1000];
    UILabel *phoneLabel = (UILabel *)[cell.contentView viewWithTag:1001];
    
    nameLabel.text = item.name;
    phoneLabel.text = item.phoneNumber;

    return cell;

}

#pragma mark - Navigation
- (IBAction)addPOIButtonClicked:(UIButton *)sender {
    NSLog(@"Add POI button clicked");
    [self performSegueWithIdentifier:@"addPOISegue" sender:sender];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton*)sender {
    
    //    NSLog(@"The sender is %@", sender);
    if ([[segue identifier] isEqualToString:@"addPOISegue"]) {
        DetailsViewController *destinationVC = segue.destinationViewController;
        
        // This was added
        CGPoint point = [sender convertPoint:CGPointZero toView:self.tableView];
        // And referenced in here
        NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:point];
        NSLog(@"NSIndexPath *indexPath's index is %@", indexPath);
        MKMapItem *item = _mapItems[indexPath.row];
        NSLog(@"ResultsTVC item is %@", item);
        destinationVC.item= item;
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/




@end
