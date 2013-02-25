//
//  EtudiantController.m
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 16/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "EtudiantController.h"
#import "RootViewController.h"

@interface EtudiantController ()

@end

@implementation EtudiantController
@synthesize topImage, viewAnimates, myButtonBack;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)back:(id)sender {
    [myButtonBack setEnabled:NO];
    [self dismissModalViewControllerAnimated:YES];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepare seguee....!:%@",segue.identifier);
    if ([segue.identifier isEqualToString:@"tabView"]) {
         RootViewController *destViewController = segue.destinationViewController;
        [destViewController initData];
    }
    //        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    //        RecipeDetailViewController *destViewController = segue.destinationViewController;
    //        destViewController.recipeName = [recipes objectAtIndex:indexPath.row];
    //    }
}


@end
