//
//  EdtViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by B2IB on 05/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "ViewController.h"


@interface EdtViewController : UIViewController{
    IBOutlet UIWebView *webEdt;
    IBOutlet UIBarButtonItem *next;
    IBOutlet UIBarButtonItem *before;
    IBOutlet UINavigationItem *navBar;
    int numWeek;
    NSString *edtName;
    NSString *edtID;

    IBOutlet UIView *viewAnimates;
    IBOutlet UIImageView *topImage;
    UIButton *myButtonBack;
}

@property (nonatomic, retain) IBOutlet UIView *viewAnimates;
@property (nonatomic, retain) IBOutlet UIImageView *topImage;


@property (nonatomic, retain) UIWebView *webEdt;
@property (nonatomic, retain) UIBarButtonItem *next;
@property (nonatomic, retain) UIBarButtonItem *before;
@property (nonatomic, retain) UINavigationItem *navBar;

- (IBAction) next: (UIBarButtonItem *) sender;
- (IBAction) before: (UIBarButtonItem *) sender;

- (IBAction)back:(id)sender;



@end
