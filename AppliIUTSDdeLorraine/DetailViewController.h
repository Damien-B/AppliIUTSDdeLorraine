//
//  DetailViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 17/01/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//test

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController{
     UILabel *txtlabel;
    
}
@property (retain, nonatomic) IBOutlet UIButton *dismiss;
- (IBAction)dismissAction:(id)sender;
@property (nonatomic, retain) UILabel *txtlabel;
@end
