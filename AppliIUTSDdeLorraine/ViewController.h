//
//  ViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 14/12/12.
//  Copyright (c) 2012 Damien Bannerot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "RootViewController.h"
#import "SlidableView.h"

@interface ViewController : UIViewController<SlidableView> {

    NSString *response;
    IBOutlet UIView *viewAnimates;
    IBOutlet UIView *viewSRC;
    IBOutlet UIImageView *topImage;

    
}


@property (nonatomic, retain) IBOutlet UIView *viewAnimates;
@property (nonatomic, retain) IBOutlet UIView *viewSRC;

@property (nonatomic, retain) IBOutlet UIImageView *topImage;

//
//- (void) setDisableAllButtons: (bool) disable;


@end
