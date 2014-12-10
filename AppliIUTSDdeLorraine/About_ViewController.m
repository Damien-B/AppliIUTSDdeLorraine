//
//  IUT_ViewController.m
//  AppliIUTSDdeLorraine
//
//  Created by Gaël Hellé on 14/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "About_ViewController.h"

@interface About_ViewController ()

@end

@implementation About_ViewController

@synthesize myDocView, viewAnimates, topImage;





- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}






- (void)viewDidLoad
{
   [super viewDidLoad];
    NSURL * resourcePathURL = [[NSBundle mainBundle] resourceURL];
    if(resourcePathURL)
    {
        NSURL * urlToLoad = [resourcePathURL
                             URLByAppendingPathComponent: @"about.html"];
        if(urlToLoad)
        {
            NSURLRequest * req = [NSURLRequest requestWithURL: urlToLoad];
            [myDocView loadRequest: req];
        }
    }
    
}

//
//
//
//- (BOOL)webView:(UIWebView *)webView
//shouldStartLoadWithRequest:(NSURLRequest *)request
// navigationType:(UIWebViewNavigationType)navigationType {
//    //if (navigationType == UIWebViewNavigationTypeFormSubmitted) {
//    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
//        NSURL *url = [request URL];
//        if (![[url scheme] hasPrefix:@"file"]) {
//            [[UIApplication sharedApplication] openURL:url];
//            return NO;
//        }
//    }
//    return YES;
//}
//
//
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    if ([[UIDevice currentDevice] userInterfaceIdiom] ==
//        UIUserInterfaceIdiomPhone) {
//        return (interfaceOrientation !=
//                UIInterfaceOrientationPortraitUpsideDown);
//    } else {
//        return YES;
//    }
//}

- (BOOL )shouldAutorotate{
    return NO;
    
}


@end
