//
//  SelectEDTController.h
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 16/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectEDTController : UIViewController{
    NSMutableString *myEDTName;
    NSMutableString *myEDTCode;
    IBOutlet UIView *viewAnimates;
    IBOutlet UIImageView *topImage;
    UIButton *myButtonBack;
    
}
@property (nonatomic, retain) NSMutableString *myEDTName;
@property (nonatomic, retain) NSMutableString *myEDTCode;


@property (nonatomic, retain) IBOutlet UIView *viewAnimates;
@property (nonatomic, retain) IBOutlet UIImageView *topImage;

- (IBAction)back:(id)sender;


- (IBAction) selectEDT:(id)sender;

@end
