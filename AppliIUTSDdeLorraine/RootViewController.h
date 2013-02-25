//
//  RootViewController.h
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 14/12/12.
//  Copyright (c) 2012 Damien Bannerot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "ODRefreshControl.h"
#import "SlidableView.h"

@interface RootViewController : UIViewController<SlidableView> {
    NSMutableArray *tabNews;
    UILabel *titre;
    NSString *newsCurrentTitle;
    NSString *newsCurrentContent;
    IBOutlet UITableView *tabView;
    ODRefreshControl *refreshControl;
    IBOutlet UIImageView *topImage;
    IBOutlet UIView *viewAnimates;

}

-(NSString *)getCurrentNewsTitle;
-(NSString *)getCurrentNewsContent;
- (IBAction)back:(id)sender;
- (void) updateNews;
- (void) initData;

@property (nonatomic, retain) IBOutlet UIView *viewAnimates;
@property (nonatomic, retain) IBOutlet UIImageView *topImage;

@property (nonatomic, retain) NSMutableArray *tabNews;
@property (nonatomic, retain) UILabel *titre;
@property (retain, nonatomic) IBOutlet UITableView *tabView;

@end
