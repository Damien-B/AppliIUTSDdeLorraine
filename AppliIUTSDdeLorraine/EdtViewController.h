//
//  EdtViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by B2IB on 05/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "ViewController.h"


@interface EdtViewController : UIViewController<UIScrollViewDelegate>{
    IBOutlet UIWebView *webEdt;
    IBOutlet UIBarButtonItem *next;
    IBOutlet UIBarButtonItem *before;
    IBOutlet UIToolbar *navBar;
    int numWeek;
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
@property (nonatomic, retain) UIToolbar *navBar;
@property (nonatomic, retain) NSString *edtID;




- (IBAction) next: (UIBarButtonItem *) sender;
- (IBAction) before: (UIBarButtonItem *) sender;

- (IBAction)back:(id)sender;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

@end
