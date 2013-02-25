//
//  OpenAnimation.m
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 25/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "OpenAnimation.h"

#import "SlidableView.h"
#import "ViewController.h"
#import "AuthController.h"
@implementation OpenAnimation

-(void) perform {
    
    ViewController<SlidableView> *src =  self.sourceViewController;
    AuthController<SlidableView> *dest =  self.destinationViewController;
    [dest loadView];
    dest.viewCover = src.viewAnimates;
    [self.sourceViewController presentModalViewController:[self destinationViewController] animated:NO];
    //[dest.viewAnimates setTransform:CGAffineTransformMakeTranslation(dest.viewAnimates.frame.size.width, 0) ];
    [dest.viewAnimates insertSubview: src.viewAnimates belowSubview: dest.topImage];
    [src.viewSRC setTransform:CGAffineTransformMakeTranslation(0, 0) ];

    [UIView animateWithDuration:0.4
                          delay:0.0
                        options:UIViewAnimationOptionTransitionFlipFromTop
                     animations:^{
                         [src.viewAnimates setTransform:CGAffineTransformMakeTranslation(0, 300)];
                     }
                     completion:^(BOOL finished){
                         //[dest loadView];
                         //[dest.view  insertSubview:dest.viewAnimates belowSubview:dest.topImage];
                         //[dest.view  insertSubview:src.viewSRC aboveSubview:dest.view];
                         //[self.sourceViewController presentModalViewController:[self destinationViewController] animated:NO];;
                         //[dest viewDidLoad];
                         
                     }];
    
    
}

@end
