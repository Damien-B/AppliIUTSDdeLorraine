//
//  PreferencesViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 12/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlidableView.h"
 
@interface PreferencesViewController : UIViewController<SlidableView>{
    
    IBOutlet UISwitch *edt;
    IBOutlet UISwitch *pedagogie;
    IBOutlet UISwitch *general;
    IBOutlet UISwitch *divertissement;
    IBOutlet UISwitch *covoiturage;
    IBOutlet UIButton *prefsend;
    NSString *strResult;
    IBOutlet UIImageView *topImage;
    IBOutlet UIView *viewAnimates;
}


@property (nonatomic, retain) IBOutlet UIView *viewAnimates;
@property (nonatomic, retain) IBOutlet UIImageView *topImage;


@property (nonatomic, retain) IBOutlet UISwitch *edt;
@property (nonatomic, retain) IBOutlet UISwitch *pedagogie;
@property (nonatomic, retain) IBOutlet UISwitch *general;
@property (nonatomic, retain) IBOutlet UISwitch *divertissement;
@property (nonatomic, retain) IBOutlet UISwitch *covoiturage;
@property (nonatomic, retain) IBOutlet UIButton *prefsend;
@property (nonatomic, retain) NSString *strResult;
- (IBAction) prefsend: (UIButton *) sender;
- (BOOL )shouldAutorotate;
- (IBAction)back:(id)sender ;
@end
