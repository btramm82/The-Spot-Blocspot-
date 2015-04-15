//
//  DetailsViewController.m
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 3/11/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//


#import "DetailsViewController.h"


@interface DetailsViewController ()

@property CLLocationCoordinate2D itemLocation;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;

@end

@implementation DetailsViewController
@synthesize place;
@synthesize showLocation;


- (void)viewDidLoad {
    [super viewDidLoad];
    NSManagedObject *selectedPlace = self.place;
    if (selectedPlace == nil) {
        [self.showLocation setHidden:YES];
    }
    

    if (self.place) {
        [self.detailsName setText:[self.place valueForKey:@"name"]];
        [self.detailsURL setText:[self.place valueForKey:@"website"]];
        [self.detailsAddress setText:[self.place valueForKey:@"address"]];
        [self.detailsAddressTwo setText:[self.place valueForKey:@"addressTwo"]];
        [self.detailsPhone setText:[self.place valueForKey:@"phoneNumber"]];
        [self.detailsNote setText:[self.place valueForKey:@"note"]];
        [self.detailsCategory setText:[self.place valueForKey:@"category"]];
       
    } else {
        // Name
        self.detailsName.text = [self item].name;
    
    // Address
    MKPlacemark *placemark = [self item].placemark;
    NSDictionary *address = placemark.addressDictionary;
    NSString *addressString = @"";
    NSString *addressStringTwo = @"";
    NSString *name = @"";
    NSString *subThoroughfare = @"";
    NSString *thoroughfare = @"";
    NSString *city = @"";
    NSString *state = @"";
    NSString *zip = @"";
    NSString *country = @"";
    NSString *url = @"";
        
    
    name = [address objectForKey:@"Name"] ? [address objectForKey:@"Name"] : @"";
    subThoroughfare = [address objectForKey:@"SubThoroughfare"] ? [address objectForKey:@"SubThoroughfare"] : @"";
    thoroughfare = [address objectForKey:@"Thoroughfare"] ? [address objectForKey:@"Thoroughfare"] : @"";
    city = [address objectForKey:@"City"] ? [address objectForKey:@"City"] : @"";
    state = [address objectForKey:@"State"] ? [address objectForKey:@"State"] : @"";
    zip = [address objectForKey:@"ZipCode"] ? [address objectForKey:@"ZipCode"] : @"";
    country = [address objectForKey:@"Country"] ? [address objectForKey:@"Country"] : @"";
    url = [address objectForKey:@"url"] ? [address objectForKey:@"url"] : @"";
   
        
    
    addressString = [NSString stringWithFormat:@"%@, %@", subThoroughfare,thoroughfare];
    addressStringTwo = [NSString stringWithFormat:@"%@, %@, %@, %@", city, state, zip, country];
    self.detailsAddress.text = addressString;
    self.detailsAddressTwo.text = addressStringTwo;
    
        
    
    // Phone Number
    self.detailsPhone.text = [self item].phoneNumber;
    
    // Website
    NSString *urlString = [[self item].url absoluteString];
    self.detailsURL.text = urlString;
     
    // Coordinates (Lat and Long)
    //self.itemLocation = CLLocationCoordinate2DMake(placemark.location.coordinate.latitude, placemark.location.coordinate.longitude);\
    double lat = self.itemLocation.latitude;
        self.latitude = [NSNumber numberWithDouble: self.item.placemark.location.coordinate.latitude];
    //double longi = self.itemLocation.longitude;
        self.longitude = [NSNumber numberWithDouble:self.item.placemark.location.coordinate.longitude];
        
    
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)myTextField{
    [self.detailsCategory resignFirstResponder];
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"LocationCategory"];
    NSArray *categories = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    UIActionSheet *actionSheet = [[UIActionSheet alloc] init];
    actionSheet.title = @"Select Category";
    actionSheet.delegate = self;
    [actionSheet addButtonWithTitle:@"Cancel"];
    [actionSheet addButtonWithTitle:@"Add New Category"];
    for (LocationCategory *item in categories)
    {
        [actionSheet addButtonWithTitle:item.categoryName];
    }
    actionSheet.cancelButtonIndex = 0;
    actionSheet.destructiveButtonIndex = 1;
    [actionSheet showInView:self.view];
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Add New Category"]) {
        [self performSegueWithIdentifier:@"addCategory" sender:self];
    } else if ([buttonTitle isEqualToString:@"Cancel"]){
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        self.detailsCategory.text = [actionSheet buttonTitleAtIndex:buttonIndex];
        
    }
}

- (IBAction)showLocationOnMap:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSManagedObject *selectedPlace = self.place;
    if (selectedPlace == nil) {
        [button setHidden:YES];
    } else {
    }
}

- (IBAction)saveDetails:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
// Update Existing Place
    if (self.place) {
        [self.place setValue:self.detailsName.text forKey:@"name"];
        [self.place setValue:self.detailsURL.text forKey:@"website"];
        [self.place setValue:self.detailsAddress.text forKey:@"address"];
        [self.place setValue:self.detailsAddressTwo.text forKey:@"addressTwo"];
        [self.place setValue:self.detailsPhone.text forKey:@"phoneNumber"];
        [self.place setValue:self.detailsNote.text forKey:@"note"];
        [self.place setValue:self.detailsCategory.text forKey:@"category"];
        [self.place setValue:self.latitude forKey:@"latitude"];
        [self.place setValue:self.longitude forKey:@"longitude"];
        
        //[self.place setValue:self.itemLocation.latitude forKey:@"latitude"];
        
    } else {
//Create a new managed object
    NSManagedObject *newPlace = [NSEntityDescription insertNewObjectForEntityForName:@"PlacesOfInterest" inManagedObjectContext:context];
    [newPlace setValue:self.detailsName.text forKey:@"name"];
    [newPlace setValue:self.detailsURL.text forKey:@"website"];
    [newPlace setValue:self.detailsAddress.text forKey:@"address"];
    [newPlace setValue:self.detailsAddressTwo.text forKey:@"addressTwo"];
    [newPlace setValue:self.detailsPhone.text forKey:@"phoneNumber"];
    [newPlace setValue:self.detailsNote.text forKey:@"note"];
    [newPlace setValue:self.detailsCategory.text forKey:@"category"];
    [newPlace setValue:self.latitude forKey:@"latitude"];
    [newPlace setValue:self.longitude forKey:@"longitude"];
}
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
}

#pragma mark - Core Data

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"detailToList"]) {
        [self saveDetails:nil];
    } if ([[segue identifier] isEqualToString:@"addCategory"]) {
    } if ([[segue identifier] isEqualToString:@"showLocationOnMap"]) {
        NSManagedObject *selectedPlace = self.place;
        MapViewController *destViewController = segue.destinationViewController;
        destViewController.place = (PlacesOfInterest *)selectedPlace;
    }
}
@end
