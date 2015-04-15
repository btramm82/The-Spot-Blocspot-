//
//  AddCategoryViewController.h
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 4/6/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface AddCategoryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *categoryToAdd;

- (IBAction)cancelAddCategory:(id)sender;

- (IBAction)saveCategory:(id)sender;





@end
