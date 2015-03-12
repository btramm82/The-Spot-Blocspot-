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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Name
    self.detailsName.text = _item.placemark.name;
    
   
    
    // Address
    MKPlacemark *placemark = _item.placemark;
    NSDictionary *address = placemark.addressDictionary;
    NSString *addressString = @"";
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
    zip = [address objectForKey:@"Zip"] ? [address objectForKey:@"Zip"] : @"";
    country = [address objectForKey:@"Country"] ? [address objectForKey:@"Country"] : @"";
    url = [address objectForKey:@"url"] ? [address objectForKey:@"url"] : @"";

    addressString = [NSString stringWithFormat:@"%@, %@, \n %@, %@, %@, %@", subThoroughfare, thoroughfare, city, state, zip, country];
    
    self.detailsAddress.text = addressString;
    
    // Phone Number
    self.detailsPhone.text = _item.phoneNumber;
    
    //Website
    NSString *urlString = [_item.url absoluteString];
    self.detailsURL.text = urlString;
    
    ;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
