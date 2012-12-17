//
//  RootViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 14/12/12.
//  Copyright (c) 2012 Damien Bannerot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController<UITableViewDataSource> {
    NSArray *tabNews;
}

@property (nonatomic, retain) NSArray *tabNews;

@end
