//
//  PreferencesViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 12/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreferencesViewController : UIViewController{
    
    IBOutlet UISwitch *edt;
    IBOutlet UISwitch *pedagogie;
    IBOutlet UISwitch *general;
    IBOutlet UISwitch *divertissement;
    IBOutlet UISwitch *covoiturage;
    IBOutlet UIButton *prefsend;
    NSString *strResult;
    IBOutlet UIButton *retour;
}


@property (nonatomic, retain) IBOutlet UISwitch *edt;
@property (nonatomic, retain) IBOutlet UISwitch *pedagogie;
@property (nonatomic, retain) IBOutlet UISwitch *general;
@property (nonatomic, retain) IBOutlet UISwitch *divertissement;
@property (nonatomic, retain) IBOutlet UISwitch *covoiturage;
@property (nonatomic, retain) IBOutlet UIButton *prefsend;
@property (nonatomic, retain) IBOutlet UIButton *retour;
@property (nonatomic, retain) NSString *strResult;
- (IBAction) prefsend: (UIButton *) sender;
- (IBAction) retour: (UIButton *) sender;

@end
