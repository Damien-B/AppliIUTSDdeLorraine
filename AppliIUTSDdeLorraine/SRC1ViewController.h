//
//  SRC1ViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by B2IB on 08/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "EdtViewController.h"

@interface SRC1ViewController : EdtViewController{
    IBOutlet UIWebView *webEdt;
    IBOutlet UIBarButtonItem *next;
    IBOutlet UIBarButtonItem *before;
    int numWeek;
}

@property (nonatomic, retain) UIWebView *webEdt;
@property (nonatomic, retain) UIBarButtonItem *next;
@property (nonatomic, retain) UIBarButtonItem *before;

- (IBAction) next: (UIBarButtonItem *) sender;
- (IBAction) before: (UIBarButtonItem *) sender;

@end
