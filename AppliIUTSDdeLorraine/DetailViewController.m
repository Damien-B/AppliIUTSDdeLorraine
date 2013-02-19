//
//  DetailViewController.m
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 17/01/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "DetailViewController.h"
#import "RootViewController.h"
#import "Utils.h"
@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize titre;
@synthesize contenu;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"in init detail");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"in init detail");
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{   NSLog(@"in init detail");
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [(RootViewController *) [self presentingViewController] getCurrentNewsTitle];
    NSString* titrerow=[(RootViewController *) [self presentingViewController] getCurrentNewsTitle];
    NSString* contenurow=[(RootViewController *) [self presentingViewController] getCurrentNewsContent];
    titre.text=titrerow;
    contenu.text=contenurow;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_dismiss release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setDismiss:nil];
    [super viewDidUnload];
}
- (IBAction)dismissAction:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
