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
    intro2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sponsor.png"]];
    
    //envoi vers script pour test si présence dans la bdd
    NSString *url = [NSString stringWithFormat:@"http://iutsd.applorraine.fr/ajoutbdd.php?uuid=%@", [Utils getDeviceID]];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1.0];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(connection){
        NSLog(@"connected, url=%@", url);
    }else{
        NSLog(@"not connected");
    }

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(void) viewDidAppear:(BOOL)animated
{
    [NSThread sleepForTimeInterval: 5];
    
    [UIView transitionFromView: self.view
                        toView: intro2
                      duration: 5.0f
                       options: UIViewAnimationTransitionCurlDown
                    completion: ^(BOOL done){
                        [NSThread sleepForTimeInterval: 5.0];
                        if(done){
                            self.view = intro2;
                            [self performSegueWithIdentifier:@"transition" sender:self];
                            
                        }
                    }];
    
}



@end
