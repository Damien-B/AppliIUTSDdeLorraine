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

}
@property (nonatomic, retain) NSMutableString *myEDTName;
@property (nonatomic, retain) NSMutableString *myEDTCode;



- (IBAction) selectEDT:(id)sender;

@end
