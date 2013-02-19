//
//  RootViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 14/12/12.
//  Copyright (c) 2012 Damien Bannerot. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"

@interface RootViewController : UITableViewController<UITableViewDataSource> {
    NSMutableArray *tabNews;
    UILabel *titre;
    DetailViewController *detailViewCtr;
    NSString *newsCurrentTitle;
    NSString *newsCurrentContent;
}

-(NSString *)getCurrentNewsTitle;
-(NSString *)getCurrentNewsContent;
@property (nonatomic, retain) NSMutableArray *tabNews;
@property (nonatomic, retain) UILabel *titre;
@property (nonatomic, retain) DetailViewController *detailViewCtr;

@end
