//
//  IUT_ViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by Gaël Hellé on 14/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SlidableView.h"

@interface About_ViewController : UIViewController<UIWebViewDelegate,SlidableView>{

    IBOutlet UIWebView *myDocView;
    IBOutlet UIImageView *topImage;
    IBOutlet UIView *viewAnimates;
}

@property (nonatomic, retain) IBOutlet UIWebView *myDocView;
@property (nonatomic, retain) IBOutlet UIView *viewAnimates;
@property (nonatomic, retain) IBOutlet UIImageView *topImage;

- (IBAction)done:(id)sender;

@end


