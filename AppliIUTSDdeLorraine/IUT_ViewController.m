//
//  IUT_ViewController.m
//  AppliIUTSDdeLorraine
//
//  Created by Gaël Hellé on 14/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "IUT_ViewController.h"

@interface IUT_ViewController ()

@end

@implementation IUT_ViewController

@synthesize myDocView;





- (IBAction)done:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}






- (void)viewDidLoad
{
    NSURL * resourcePathURL = [[NSBundle mainBundle] resourceURL];
    if(resourcePathURL)
    {
        NSURL * urlToLoad = [resourcePathURL
                             URLByAppendingPathComponent: @"iut.html"];
        if(urlToLoad)
        {
            NSURLRequest * req = [NSURLRequest requestWithURL: urlToLoad];
            [myDocView loadRequest: req];
        }
    }
}




- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
    //if (navigationType == UIWebViewNavigationTypeFormSubmitted) {
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        NSURL *url = [request URL];
        if (![[url scheme] hasPrefix:@"file"]) {
            [[UIApplication sharedApplication] openURL:url];
            return NO;
        }
    }
    return YES;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] ==
        UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation !=
                UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


@end
