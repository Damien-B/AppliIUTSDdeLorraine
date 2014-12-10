//
//  StartController.m
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 14/12/12.
//  Copyright (c) 2012 Damien Bannerot. All rights reserved.
//

#import "StartController.h"
#import  "Utils.h"
@interface StartController()

@end

@implementation StartController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
  
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void) viewDidAppear:(BOOL)animated
{
    [NSThread sleepForTimeInterval: 1];    
    [UIView transitionFromView: self.view
                        toView: intro2
                      duration: 1.0f
                       options: UIViewAnimationOptionTransitionFlipFromRight
                    completion: ^(BOOL done){
                        [NSThread sleepForTimeInterval: 2.0];
                        if(done){
                            self.view = intro2;
                            [self performSegueWithIdentifier:@"transition" sender:self];
                        }
                    }];
    [super viewDidAppear:animated];

}

- (BOOL )shouldAutorotate{
    return NO;
    
}



@end
