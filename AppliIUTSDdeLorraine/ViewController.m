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
@interface ViewController ()

@end

@implementation ViewController

@synthesize bconnection;

@synthesize log;
@synthesize mdp;
@synthesize toto;

- (IBAction) bconnection: (UIButton *) sender{
    NSString *vallog = [log text];
    NSString *valmdp = [mdp text];
    toto.text = vallog;
    NSString *url = [NSString stringWithFormat:@"http://www.applorraine.fr/testconnexion.php?log=%@&mdp=%@", vallog, valmdp];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15.0];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(connection){
        NSLog(@"connected");
    }else{
        NSLog(@"not connected");
    }
}

- (void)connection{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
