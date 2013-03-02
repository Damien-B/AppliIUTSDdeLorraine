//
//  EdtViewController.m
//  AppliIUTSDdeLorraine
//
//  Created by B2IB on 05/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "EdtViewController.h"
#import "SelectEDTController.h"
#import "SlidableView.h"


@interface EdtViewController ()

@end



@implementation EdtViewController


@synthesize webEdt;
@synthesize next;
@synthesize before, navBar;
@synthesize viewAnimates, topImage;

- (id) init{
    NSLog(@"init EDDDTT i,");
    return  self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"init EDDDTT");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [myButtonBack setEnabled:FALSE];

    // Do any additional setup after loading the view.
   // self.webEdt = [[[UIWebView alloc]
    //                initWithFrame:CGRectMake(0, 40, 320, 380)] autorelease];
    SelectEDTController * prev =(SelectEDTController *) [self presentingViewController];
    [navBar setTitle:  prev.myEDTName];
    edtID = prev.myEDTCode;
    NSError *error = nil;
    NSURL *urlmaj = [NSURL URLWithString:@"http://kerrecherche.iutsd.uhp-nancy.fr/AppliIUTSDdeLorraine/idEDT.php"];
    NSString *maj = [NSString stringWithContentsOfURL:urlmaj encoding:NSUTF8StringEncoding error:&error];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"ww"];
    NSString *weeka = [df stringFromDate:date];
    numWeek = [weeka integerValue] + 17 % 51;
    NSString *week = [NSString stringWithFormat:@"%d",numWeek];
    
    //NSLog(week);
    
    //  NSURL *urlweek = [NSURL URLWithString:@"http://iutsd.applorraine.fr/week.php"];
    
    // NSString *week = [NSString stringWithContentsOfURL:urlweek encoding:NSUTF8StringEncoding error:&error];
    
    NSString *day = @"0%2C1%2C2%2C3%2C4%2C5";
    
  //  NSString *Tree = @"5962%2C5963";
    
    
    
    NSString *urlAddress = [NSString stringWithFormat:@"http://adeweb.uhp-nancy.fr/jsp/imageEt?identifier=%@&projectId=5&idPianoWeek=%@&idPianoDay=%@&idTree=%@&width=2000&height=420&lunchName=REPAS&displayMode=1057855&showLoad=false&ttl=1253016797184&displayConfId=126", maj, week, day, edtID];
    NSLog(@"in load %@", urlAddress);
    NSURL *url = [[[NSURL alloc] initWithString:urlAddress] autorelease];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [self.webEdt loadRequest:requestObj];
    [myButtonBack setEnabled:YES];
    [df dealloc];
   //[self.view addSubview:self.webEdt];
}

- (IBAction) next: (UIBarButtonItem *) sender{
 //   self.webEdt = [[[UIWebView alloc]
  //                  initWithFrame:CGRectMake(0, 40, 320, 380)] autorelease];
    
    NSError *error = nil;
    
    numWeek = numWeek + 1;
    
    NSString *week = [NSString stringWithFormat:@"%d",numWeek];
    
    NSURL *urlmaj = [NSURL URLWithString:@"http://kerrecherche.iutsd.uhp-nancy.fr/AppliIUTSDdeLorraine/idEDT.php"];
    NSString *maj = [NSString stringWithContentsOfURL:urlmaj encoding:NSUTF8StringEncoding error:&error];
    
    NSString *day = @"0%2C1%2C2%2C3%2C4%2C5";
        
    NSString *urlAddress = [NSString stringWithFormat:@"http://adeweb.uhp-nancy.fr/jsp/imageEt?identifier=%@&projectId=5&idPianoWeek=%@&idPianoDay=%@&idTree=%@&width=2000&height=420&lunchName=REPAS&displayMode=1057855&showLoad=false&ttl=1253016797184&displayConfId=126", maj, week, day, edtID];
    NSURL *url = [[[NSURL alloc] initWithString:urlAddress] autorelease];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [self.webEdt loadRequest:requestObj];
    
    //[self.view addSubview:self.webEdt];
    
}

-(IBAction)before :(UIBarButtonItem *) sender{
    
  //  self.webEdt = [[[UIWebView alloc]
   //                 initWithFrame:CGRectMake(0, 40, 320, 380)] autorelease];
    
    NSError *error = nil;
    
    numWeek = numWeek - 1;
    
    NSString *week = [NSString stringWithFormat:@"%d",numWeek];
    
    NSURL *urlmaj = [NSURL URLWithString:@"http://kerrecherche.iutsd.uhp-nancy.fr/AppliIUTSDdeLorraine/idEDT.php"];
    NSString *maj = [NSString stringWithContentsOfURL:urlmaj encoding:NSUTF8StringEncoding error:&error];
    
    NSString *day = @"0%2C1%2C2%2C3%2C4%2C5";
    
    
    NSString *urlAddress = [NSString stringWithFormat:@"http://adeweb.uhp-nancy.fr/jsp/imageEt?identifier=%@&projectId=5&idPianoWeek=%@&idPianoDay=%@&idTree=%@&width=2000&height=420&lunchName=REPAS&displayMode=1057855&showLoad=false&ttl=1253016797184&displayConfId=126", maj, week, day, edtID];
    NSURL *url = [[[NSURL alloc] initWithString:urlAddress] autorelease];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [self.webEdt loadRequest:requestObj];
    
  //  [self.view addSubview:self.webEdt];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)back:(id)sender {
    [myButtonBack setEnabled:FALSE];
    UIView * previousView = [(UIViewController<SlidableView> *)[self presentingViewController] viewAnimates];
    [[self view] insertSubview: previousView belowSubview: viewAnimates ];
    [UIView animateWithDuration:0.4
                          delay:0.0
                        options:UIViewAnimationOptionTransitionFlipFromTop
                     animations:^{
                         [viewAnimates setTransform:CGAffineTransformMakeTranslation(0, viewAnimates.frame.size.height)];
                         
                     }
                     completion:^(BOOL finished){
                         [[(UIViewController<SlidableView> *)[self presentingViewController] view] insertSubview: previousView belowSubview: [(UIViewController<SlidableView>*)[self presentingViewController] topImage] ];
                         [self dismissModalViewControllerAnimated:NO];
                         [webEdt dealloc];
                     }];

}



@end





