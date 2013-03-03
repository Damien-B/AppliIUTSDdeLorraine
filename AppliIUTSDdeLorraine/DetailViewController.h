//
//  DetailViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 17/01/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//test

#import <UIKit/UIKit.h>
#import "SlidableView.h"
@interface DetailViewController : UIViewController<SlidableView>{
    IBOutlet UILabel *titre;
    IBOutlet UITextView *contenu;
    IBOutlet UIView *viewAnimates;
    IBOutlet UIImageView *topImage;

    
    
}
@property (nonatomic, retain) IBOutlet UIView *viewAnimates;
@property (nonatomic, retain) IBOutlet UIImageView *topImage;
@property (nonatomic, retain) IBOutlet UILabel *titre;
@property (nonatomic, retain) IBOutlet UITextView *contenu;

- (IBAction)back:(id)sender;
- (void) initData: (NSString *) aTitre : (NSString *) aContenu;

@end
