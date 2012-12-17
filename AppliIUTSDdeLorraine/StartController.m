//
//  StartController.m
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 14/12/12.
//  Copyright (c) 2012 Damien Bannerot. All rights reserved.
//

#import "StartController.h"

@interface StartController()

@end

@implementation StartController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    intro2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"intro2.png"]];
    
    
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
                      duration: 0.1f
                       options: UIViewAnimationTransitionCurlDown
                    completion: ^(BOOL done){
                        [NSThread sleepForTimeInterval: 1];
                        if(done){
                            self.view = intro2;
                            [self performSegueWithIdentifier:@"transition" sender:self];
                            
                        }
                    }];
    
}

@end
