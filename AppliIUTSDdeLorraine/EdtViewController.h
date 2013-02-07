//
//  EdtViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by B2IB on 05/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "ViewController.h"

@interface EdtViewController : UIViewController{
    IBOutlet UIImageView *imgEdt;
    IBOutlet UIButton *src1;
    IBOutlet UIButton *src2;
    IBOutlet UIBarButtonItem *close;
    IBOutlet UIScrollView *scroll;
}

@property (nonatomic, retain) UIImageView *imgEdt;
@property (nonatomic, retain) UIButton *src1;
@property (nonatomic, retain) UIButton *src2;
@property (nonatomic, retain) UIScrollView *scroll;
@property (nonatomic, retain) UIBarButtonItem *close;
- (IBAction) src1: (UIButton *) sender;
- (IBAction) src2: (UIButton *) sender;
- (IBAction) close: (UIBarButtonItem *) sender;

@end
