//
//  WebViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by B2IB on 09/01/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController: UIViewController {
    IBOutlet UIWebView *webView;
}

@property (nonatomic, retain) UIWebView *webView;

@end