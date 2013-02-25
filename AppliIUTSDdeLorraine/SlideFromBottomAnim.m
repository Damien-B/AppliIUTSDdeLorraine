//
//  SlideFromBottomAnim.m
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 20/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "SlideFromBottomAnim.h"
#import "EtudiantController.h"
#import "SlidableView.h"

@implementation SlideFromBottomAnim

static Boolean isInUse=NO;



-(void) perform {
    if (isInUse) {
        return;
    }
    isInUse = YES;
    UIViewController<SlidableView> *src =  self.sourceViewController;
    UIViewController<SlidableView> *dest =  self.destinationViewController;
    [dest loadView];

    [dest.viewAnimates setTransform:CGAffineTransformMakeTranslation(dest.viewAnimates.frame.size.width, 0) ];
    [src.view setAlpha:1.0];
    [src.view  insertSubview:dest.viewAnimates belowSubview:src.topImage];

    [UIView animateWithDuration:0.4
                          delay:0.0
                        options:UIViewAnimationOptionTransitionFlipFromTop
                     animations:^{
                         [dest.viewAnimates setTransform:CGAffineTransformMakeTranslation(0, 0)];
                     }
                     completion:^(BOOL finished){
                         [dest loadView];
                         [dest.view  insertSubview:dest.viewAnimates belowSubview:dest.topImage];
                         [self.sourceViewController presentModalViewController:[self destinationViewController] animated:NO];;
                         [dest viewDidLoad];
                         isInUse = NO;
                         
                     }];


}

@end
