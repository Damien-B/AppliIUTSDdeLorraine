//
//  DetailViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 17/01/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//test

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController{
    IBOutlet UILabel *titre;
    IBOutlet UILabel *contenu;
    
}
@property (retain, nonatomic) IBOutlet UIButton *dismiss;
- (IBAction)dismissAction:(id)sender;
@property (nonatomic, retain) IBOutlet UILabel *titre;
@property (nonatomic, retain) IBOutlet UILabel *contenu;
@end
