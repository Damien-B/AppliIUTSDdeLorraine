//
//  ViewController.m
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 14/12/12.
//  Copyright (c) 2012 Damien Bannerot. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Utils.h"
#import "MapController.h"

@interface ViewController ()

@end

@implementation ViewController



@synthesize  viewAnimates, topImage, viewSRC;


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    NSString *deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppToken"];

    if([Utils detectConnectivityFromHostName:@"iutsd.applorraine.fr"]){
        
        //envoi vers script pour test si présence dans la bdd
        NSString *url = [NSString stringWithFormat:@"http://iutsd.applorraine.fr/ajoutbdd.php?uuid=%@&apptoken=%@", [Utils getDeviceID], deviceToken];
        
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1.0];
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        if(connection){
            NSLog(@"connected, url=%@", url);
        }else{
            NSLog(@"not connected");
        }
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Attention ..."
                                                        message: @"pas de connection internet, l'authentification sera pas possible."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//- (IBAction) presentAuthPanel: (UIButton *) sender{
//    NSLog(@"in animation");
//    [myCancelAuthButton setHidden:NO];
//    [UIView transitionFromView: menuPanel
//                        toView: authPanel
//                      duration: 1.0f
//                       options:  UIViewAnimationOptionTransitionFlipFromRight
//                    completion: ^(BOOL done){
//                        [myButtonBack setHidden:NO];
//
//                    }];
//}
//
//- (IBAction) returnMenuPanel: (UIButton *) sender{
//    NSLog(@"in animation");
//    [myCancelAuthButton setHidden:YES];
//    
//    [UIView transitionFromView: authPanel
//                        toView: menuPanel
//                      duration: 1.0f
//                       options:  UIViewAnimationOptionTransitionFlipFromLeft
//                    completion: ^(BOOL done){
//                        [myButtonBack setHidden:YES];
//
//                    }];
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSLog(@"prepare seguee....!:%@",segue.identifier);
//    if ([segue.identifier isEqualToString:@"tabView"]) {
//        NSLog(@"for tabView!!!....!");
//    }
//    //        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//    //        RecipeDetailViewController *destViewController = segue.destinationViewController;
//    //        destViewController.recipeName = [recipes objectAtIndex:indexPath.row];
//    //    }
//}
//


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepare seguee....!:%@",segue.identifier);
    if ([segue.identifier isEqualToString:@"mapSegue"]) {
        MapController *destViewController = segue.destinationViewController;
        [destViewController loadView];
        [destViewController location];
    }
    //        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    //        RecipeDetailViewController *destViewController = segue.destinationViewController;
    //        destViewController.recipeName = [recipes objectAtIndex:indexPath.row];
    //    }
}

- (BOOL )shouldAutorotate{
    return NO;
    
}
//
//
//- (void) setDisableAllButtons: (bool) disable{
//    
//    
//    
//}





@end
