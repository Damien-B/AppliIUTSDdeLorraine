//
//  DetailViewController.m
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 17/01/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize txtlabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
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
        NSLog(@"in init");
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    NSLog(@"jlkjkl");
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
