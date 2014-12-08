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
    return  self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(orientationChanged:)  name:UIDeviceOrientationDidChangeNotification  object:nil];
    [webEdt.scrollView setDelegate:self];
}

- (void)orientationChanged:(NSNotification *)notification{
    [self adjustViewsForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (void) adjustViewsForOrientation:(UIInterfaceOrientation) orientation {
    
    if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        //load the portrait view
        //[topImage setHidden:NO];
        [UIView animateWithDuration:0.8
                              delay:0.0
                            options:UIViewAnimationOptionTransitionFlipFromTop
                         animations:^{
                             [topImage setTransform:CGAffineTransformMakeTranslation(0, 0)];
                             [navBar setTransform:CGAffineTransformMakeTranslation(0, 0)];
                             
                         }
                         completion:^(BOOL finished){
                             //[dest loadView];
                             //[dest.view  insertSubview:dest.viewAnimates belowSubview:dest.topImage];
                             //[dest.view  insertSubview:src.viewSRC aboveSubview:dest.view];
                             //[self.sourceViewController presentModalViewController:[self destinationViewController] animated:NO];;
                             //[dest viewDidLoad];
                             
                         }];
    }
    else if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight)
    {
        [UIView animateWithDuration:0.8
                              delay:0.0
                            options:UIViewAnimationOptionTransitionFlipFromTop
                         animations:^{
                             [topImage setTransform:CGAffineTransformMakeTranslation(0, -100)];
                             [navBar setTransform:CGAffineTransformMakeTranslation(0, 100)];
                             
                         }
                         completion:^(BOOL finished){
                             //[dest loadView];
                             //[dest.view  insertSubview:dest.viewAnimates belowSubview:dest.topImage];
                             //[dest.view  insertSubview:src.viewSRC aboveSubview:dest.view];
                             //[self.sourceViewController presentModalViewController:[self destinationViewController] animated:NO];;
                             //[dest viewDidLoad];
                             
                         }];
        
        //        NSLog(@"landscape..");
        //[topImage setHidden:YES];
        //  [topImage removeFromSuperview];
        //load the landscape view
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [myButtonBack setEnabled:FALSE];
    
    // Do any additional setup after loading the view.
    // self.webEdt = [[[UIWebView alloc]
    //                initWithFrame:CGRectMake(0, 40, 320, 380)] autorelease];
    SelectEDTController * prev =(SelectEDTController *) [self presentingViewController];
    edtID = prev.myEDTCode;
    //   NSError *error = nil;
    // NSURL *urlmaj = [NSURL URLWithString:@"http://kerrecherche.iutsd.uhp-nancy.fr/AppliIUTSDdeLorraine/idEDT.php"];
    //NSString *maj = [NSString stringWithContentsOfURL:urlmaj encoding:NSUTF8StringEncoding error:&error];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"ww"];
    NSString *weeka = [df stringFromDate:date];
    numWeek = ([weeka integerValue] + 17) % 51;
    NSString *week = [NSString stringWithFormat:@"%d",numWeek];
    
    //NSLog(week);
    
    //  NSURL *urlweek = [NSURL URLWithString:@"http://iutsd.applorraine.fr/week.php"];
    
    // NSString *week = [NSString stringWithContentsOfURL:urlweek encoding:NSUTF8StringEncoding error:&error];
    
    
    //  NSString *Tree = @"5962%2C5963";
    
    
    
    NSString *urlAddress = [NSString stringWithFormat:@"http://kerrecherche.iutsd.uhp-nancy.fr/edt/edt.php?week=%@&idTree=%@&width=2000&height=420&displayMode=1057855&displayConfId=127", week, edtID];
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
    
    //  NSError *error = nil;
    
    numWeek = numWeek + 1;
    
    NSString *week = [NSString stringWithFormat:@"%d",numWeek];
    NSString *urlAddress = [NSString stringWithFormat:@"http://kerrecherche.iutsd.uhp-nancy.fr/edt/edt.php?week=%@&idTree=%@&width=2000&height=420&displayMode=1057855&displayConfId=127", week, edtID];
    NSLog(@"in load %@", urlAddress);
    NSURL *url = [[[NSURL alloc] initWithString:urlAddress] autorelease];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    
    [self.webEdt loadRequest:requestObj];
    
    //[self.view addSubview:self.webEdt];
    
}

-(IBAction)before :(UIBarButtonItem *) sender{
    
    numWeek = numWeek - 1;
    
    NSString *week = [NSString stringWithFormat:@"%d",numWeek];
    NSString *urlAddress = [NSString stringWithFormat:@"http://kerrecherche.iutsd.uhp-nancy.fr/edt/edt.php?week=%@&idTree=%@&width=2000&height=420&displayMode=1057855&displayConfId=127", week, edtID];
    NSLog(@"in load %@", urlAddress);
    NSURL *url = [[[NSURL alloc] initWithString:urlAddress] autorelease];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    
    [self.webEdt loadRequest:requestObj];
    
    
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
                         [self dismissViewControllerAnimated:NO completion:nil];
                         //[webEdt dealloc];
                     }];
    
}
- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    
}



@end





