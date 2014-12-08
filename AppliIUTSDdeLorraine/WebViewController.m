//
//  WebViewController.m
//  AppliIUTSDdeLorraine
//
//  Created by B2IB on 09/01/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController()

@end

@implementation WebViewController
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[[UIWebView alloc]
                     initWithFrame:CGRectMake(0, 40, 320, 420)] autorelease];
    
    NSString *urlAddress = @"http://www.facebook.com/AppliIUTSD?ref=hl";
    NSURL *url = [[[NSURL alloc] initWithString:urlAddress] autorelease];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:requestObj];
    
    [self.view addSubview:self.webView];
}



- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}


@end
