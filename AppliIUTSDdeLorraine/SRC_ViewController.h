//
//  IUT_ViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by Gaël Hellé on 14/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface SRC_ViewController : UIViewController<UIWebViewDelegate>{
    IBOutlet UIWebView *myDocView;
    
}
@property (nonatomic, retain) IBOutlet UIWebView *myDocView;


@end



