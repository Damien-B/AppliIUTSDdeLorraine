//
//  AuthController.m
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 25/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "AuthController.h"

@interface AuthController ()

@end

@implementation AuthController


@synthesize log;
@synthesize mdp;
@synthesize toto;
@synthesize response;
@synthesize topImage, myButtonBack, vi;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Loading user pref
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    BOOL isAutoLogin = [ prefs boolForKey:@"KeyUserAutoLogin" ];
    if(isAutoLogin){
        [log setText: [prefs stringForKey: @"KeyUserName"]];
        [mdp setText: [prefs stringForKey: @"KeyUserPass"]];
        NSLog(@" autolog");
        
    }else{
        NSLog(@"non autolog");
    }
    NSLog(@"Device id (authorized): %@", [Utils getDeviceID]);
    
    // myBadgeMode = [prefs stringForKey: @"keyBadgeInfo"];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
