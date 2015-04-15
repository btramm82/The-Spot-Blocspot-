//
//  AddCategoryViewController.m
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 4/6/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import "AddCategoryViewController.h"

@interface AddCategoryViewController ()

@end

@implementation AddCategoryViewController

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
    // Do any additional setup after loading the view.
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





- (IBAction)cancelAddCategory:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveCategory:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create New Managed Object
    NSManagedObject *newCategory = [NSEntityDescription insertNewObjectForEntityForName:@"LocationCategory" inManagedObjectContext:context];
    [newCategory setValue:self.categoryToAdd.text forKey:@"categoryName"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
