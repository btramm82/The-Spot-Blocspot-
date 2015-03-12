//
//  ResultsTableViewCell.h
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 3/10/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ResultsTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;

-(IBAction)addPOI:(id)sender;


@end
