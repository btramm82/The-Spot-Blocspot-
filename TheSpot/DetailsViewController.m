//
//  DetailsViewController.m
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 3/11/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//


#import "DetailsViewController.h"


@interface DetailsViewController ()

@end

@implementation DetailsViewController
@synthesize place;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.place) {
        [self.detailsName setText:[self.place valueForKey:@"name"]];
        [self.detailsURL setText:[self.place valueForKey:@"website"]];
        [self.detailsAddress setText:[self.place valueForKey:@"address"]];
        [self.detailsAddressTwo setText:[self.place valueForKey:@"addressTwo"]];
        [self.detailsPhone setText:[self.place valueForKey:@"phoneNumber"]];
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
    
    //Website
    NSString *urlString = [[self item].url absoluteString];
    self.detailsURL.text = urlString;
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
    } else {
//Create a new managed object
    NSManagedObject *newPlace = [NSEntityDescription insertNewObjectForEntityForName:@"PlacesOfInterest" inManagedObjectContext:context];
    [newPlace setValue:self.detailsName.text forKey:@"name"];
    [newPlace setValue:self.detailsURL.text forKey:@"website"];
    [newPlace setValue:self.detailsAddress.text forKey:@"address"];
    [newPlace setValue:self.detailsAddressTwo.text forKey:@"addressTwo"];
    [newPlace setValue:self.detailsPhone.text forKey:@"phoneNumber"];
    }
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Your Place Has Been Saved" message:@"View Saved Places in Saved Places Tab" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
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

@end
