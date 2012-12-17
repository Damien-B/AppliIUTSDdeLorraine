//
//  ViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 14/12/12.
//  Copyright (c) 2012 Damien Bannerot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface ViewController : UIViewController {
    IBOutlet UIButton *bconnection;
    IBOutlet UITextField *log;
    IBOutlet UITextField *mdp;
    IBOutlet UILabel *toto;
}

@property (nonatomic, retain) IBOutlet UIButton *bconnection;
@property (nonatomic, retain) IBOutlet UITextField *log;
@property (nonatomic, retain) IBOutlet UITextField *mdp;
@property (nonatomic, retain) IBOutlet UILabel *toto;
- (IBAction) bconnection: (UIButton *) sender;
@end
