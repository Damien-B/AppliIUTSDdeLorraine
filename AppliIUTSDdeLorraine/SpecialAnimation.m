//
//  SpecialAnimation.m
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 18/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "SpecialAnimation.h"

@implementation SpecialAnimation

- (void) perform {
    
    UIViewController *src = (UIViewController *) self.sourceViewController;
    [UIView transitionWithView:src.view duration:0.2
                       options:UIViewAnimationOptionTransitionFlipFromTop
                    animations:^{
                        [src presentModalViewController:[self destinationViewController] animated:NO];;
                    }
                    completion:NULL];
}

@end
