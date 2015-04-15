//
//  CategoryDetailsTableViewController.m
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 4/8/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import "CategoryDetailsTableViewController.h"

@interface CategoryDetailsTableViewController ()
@property (nonatomic, strong) NSMutableArray *categories;
@property (nonatomic, strong) NSMutableArray *placesOfInterest;

@end

@implementation CategoryDetailsTableViewController

#pragma mark - Core Data
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.categoryName.categoryName;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Fetch the places from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"PlacesOfInterest"];
    if (self.categoryName) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", self.categoryName.categoryName];
        [fetchRequest setPredicate:predicate];
        self.categories = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
            [self.tableView reloadData];
        } else {
            self.placesOfInterest = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
            [self.tableView reloadData];
    }
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.categories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSManagedObject *categoryDetails = [self.categories objectAtIndex:indexPath.row];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@",[categoryDetails valueForKey:@"name"]]];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@", [self.placesOfInterest valueForKey:@"phoneNumber"]]];
    
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"backToDetails"]) {
        NSManagedObject *selectedPlace = [self.categories objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        DetailsViewController *destViewController = segue.destinationViewController;
        destViewController.place = selectedPlace;
    }
}

@end;
