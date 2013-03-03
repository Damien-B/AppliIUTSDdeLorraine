//
//  DetailViewController.m
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 17/01/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "DetailViewController.h"
#import "RootViewController.h"
#import "Utils.h"
@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize titre;
@synthesize contenu, viewAnimates, topImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"in init detail");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    NSLog(@"in inittt");

    self = [super init];
    if (self) {
        // Custom initialization
        
    }
    return self;
}


- (void) initData: (NSString *) aTitre : (NSString *) aContenu{
    titre.text= aTitre ;
    contenu.text= aContenu;
    NSLog(@"init data tit: %@",aTitre);
}

//

- (void)viewDidLoad
{   
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   }


-(void)viewWillAppear:(BOOL)animated{
    NSString* titrerow=[(RootViewController *) [self presentingViewController] getCurrentNewsTitle];
    NSString* contenurow=[(RootViewController *) [self presentingViewController] getCurrentNewsContent];
    titre.text=titrerow;
    contenu.text=contenurow;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
}
- (void)viewDidUnload {
    [super viewDidUnload];
}




- (IBAction)back:(id)sender {
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
                         
                     }];
    
}



- (BOOL )shouldAutorotate{
    return NO;
    
}




@end
