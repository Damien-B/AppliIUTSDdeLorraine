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
@synthesize next, edtID;
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
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(orientationChanged:)  name:UIDeviceOrientationDidChangeNotification  object:nil];
    [webEdt.scrollView setDelegate:self];
    [myButtonBack setEnabled:FALSE];
    [next setEnabled:NO];
    [before setEnabled:NO];
    
   
    
    NSDate *date = [NSDate date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"ww"];
    NSString *weeka = [df stringFromDate:date];
    [df dealloc];
    numWeek = ([weeka integerValue] + 17) % 51;
    NSString *week = [NSString stringWithFormat:@"%d",numWeek];
    
    
    
    
    NSString *urlAddress = [NSString stringWithFormat:@"http://kerrecherche.iutsd.uhp-nancy.fr/edt/edt.php?week=%@&idTree=%@&width=2000&height=420&displayMode=1057855&displayConfId=127", week, edtID];
    NSLog(@"in load %@", urlAddress);
    NSURL *url = [[[NSURL alloc] initWithString:urlAddress] autorelease];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [self.webEdt loadRequest:requestObj];
    [myButtonBack setEnabled:YES];
    [next setEnabled:YES];
    [before setEnabled:YES];
    
    //[self.view addSubview:self.webEdt];

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
    }

- (IBAction) next: (UIBarButtonItem *) sender{
     if (!webEdt.isLoading) {
        [next setEnabled:NO];
        [before setEnabled:NO];
        [myButtonBack setEnabled:NO];
        
        numWeek = numWeek + 1;
        NSString *week = [NSString stringWithFormat:@"%d",numWeek];
        NSString *urlAddress = [NSString stringWithFormat:@"http://kerrecherche.iutsd.uhp-nancy.fr/edt/edt.php?week=%@&idTree=%@&width=2000&height=420&displayMode=1057855&displayConfId=127", week, edtID];
        NSURL *url = [[[NSURL alloc] initWithString:urlAddress] autorelease];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        
        
        [self.webEdt loadRequest:requestObj];
        [next setEnabled:YES];
        [before setEnabled:YES];
        [myButtonBack setEnabled:YES];
    }
    
}

-(IBAction)before :(UIBarButtonItem *) sender{
    if (!webEdt.isLoading) {
        [next setEnabled:NO];
        [before setEnabled:NO];
        [myButtonBack setEnabled:NO];
        numWeek = numWeek - 1;
        NSString *week = [NSString stringWithFormat:@"%d",numWeek];
        NSString *urlAddress = [NSString stringWithFormat:@"http://kerrecherche.iutsd.uhp-nancy.fr/edt/edt.php?week=%@&idTree=%@&width=2000&height=420&displayMode=1057855&displayConfId=127", week, edtID];
        NSURL *url = [[[NSURL alloc] initWithString:urlAddress] autorelease];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [self.webEdt loadRequest:requestObj ];
        [next setEnabled:YES];
        [before setEnabled:YES];
        [myButtonBack setEnabled:YES];
    }
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)back:(id)sender {
    if (!webEdt.isLoading) {
        [self dismissViewControllerAnimated:NO completion:nil];

    }
    
    //    [[self view] insertSubview: previousView belowSubview: viewAnimates ];
//    [UIView animateWithDuration:0.4
//                          delay:0.0
//                        options:UIViewAnimationOptionTransitionFlipFromTop
//                     animations:^{
//                         [viewAnimates setTransform:CGAffineTransformMakeTranslation(0, viewAnimates.frame.size.height)];
//                         
//                     }
//                     completion:^(BOOL finished){
//                         [[(UIViewController<SlidableView> *)[self presentingViewController] view] insertSubview: previousView belowSubview: [(UIViewController<SlidableView>*)[self presentingViewController] topImage] ];
//                         [self dismissViewControllerAnimated:NO completion:nil];
//                         //[webEdt dealloc];
//                     }];
    
}
- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    
}



@end





