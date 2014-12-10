//
//  EtudiantController.m
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 16/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "EtudiantController.h"
#import "RootViewController.h"
#import "ViewController.h"
#import "AuthController.h"
#import "EdtViewController.h"
#import "PreferencesViewController.h"
#import "Utils.h"

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
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    NSString *isFirstApp = [[NSUserDefaults standardUserDefaults] objectForKey:@"isFirstLanch"];
    if(!isFirstApp){
        NSString *uuid = [Utils getDeviceID];

        NSString *url2 = [NSString stringWithFormat:@"http://iutsd.applorraine.fr/abonnementpref.php?UUId=%@&pref1=no&pref2=no&pref3=yes&pref4=no&pref5=no", uuid];
        NSURLRequest *request2 = [NSURLRequest requestWithURL:[NSURL URLWithString:url2] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1.0];
        NSURLConnection *connection2 = [[NSURLConnection alloc] initWithRequest:request2 delegate:self];
        if(connection2){
            [[NSUserDefaults standardUserDefaults] setObject:@"notFirst" forKey:@"isFirstLanch"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
    }
    NSString *url = [NSString stringWithFormat:@"http://iutsd.applorraine.fr/Untitled.php?uuid=%@", [Utils getDeviceID]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1.0];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(connection){
        NSLog(@"update abo ok");
    }

}

- (IBAction)back:(id)sender {
    [myButtonBack setEnabled:NO];
    UIView * previousView = [(UIViewController<SlidableView> *)[self presentingViewController] viewAnimates];
    [[self view] insertSubview: previousView belowSubview: viewAnimates ];
    [UIView animateWithDuration:0.4
                          delay:0.0
                        options:UIViewAnimationOptionTransitionFlipFromTop
                     animations:^{
                         [viewAnimates setTransform:CGAffineTransformMakeTranslation(0, viewAnimates.frame.size.height)];
                         
                     }
                     completion:^(BOOL finished){
                         [[(ViewController<SlidableView> *)[self presentingViewController] view] insertSubview: previousView belowSubview: [(UIViewController<SlidableView>*)[self presentingViewController] topImage] ];
                         [self dismissViewControllerAnimated:NO completion:nil];
                         //[(AuthController<SlidableView> *)[self presentingViewController] back: self];
                     }];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepare seguee....!:%@",segue.identifier);
    if ([segue.identifier isEqualToString:@"tabView"]) {
         RootViewController *destViewController = segue.destinationViewController;
        [destViewController initData];
        [destViewController loadView];
        
    }if ([segue.identifier isEqualToString:@"edt"]) {
        EdtViewController *destViewController = segue.destinationViewController;
        [destViewController loadView];
        
    }else if ([segue.identifier isEqualToString:@"setting"]) {
        PreferencesViewController *destViewController = segue.destinationViewController;
        [destViewController loadView];
        
    }
}


- (BOOL )shouldAutorotate{
    return NO;
    
}

@end
