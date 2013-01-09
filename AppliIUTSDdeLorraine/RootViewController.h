//
//  RootViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 14/12/12.
//  Copyright (c) 2012 Damien Bannerot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController<UITableViewDataSource> {
    NSMutableArray *tabNews;
}

@property (nonatomic, retain) NSMutableArray *tabNews;

@end
