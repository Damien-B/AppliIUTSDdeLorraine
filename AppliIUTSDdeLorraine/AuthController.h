//
//  AuthController.h
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 25/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlidableView.h"

@interface AuthController : UIViewController<SlidableView>{
    IBOutlet UIButton *bconnection;
    IBOutlet UITextField *log;
    IBOutlet UITextField *mdp;
    IBOutlet UILabel *toto;
    NSString *response;
    UIView *viewCover;
    IBOutlet UIView *viewAnimates;
    IBOutlet UIImageView *topImage;
    
}
@property (nonatomic, retain)  UIView *viewCover;

@property (nonatomic, retain) IBOutlet UIView *viewAnimates;
@property (nonatomic, retain) IBOutlet UIImageView *topImage;



@property (nonatomic, retain) IBOutlet UIButton *bconnection;
@property (nonatomic, retain) IBOutlet UITextField *log;
@property (nonatomic, retain) IBOutlet UITextField *mdp;
@property (nonatomic, retain) IBOutlet UILabel *toto;
@property (nonatomic, retain) NSString *response;


- (IBAction) bconnection: (UIButton *) sender;
- (IBAction)back:(id)sender ;
@end
