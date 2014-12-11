//
//  SelectEDTController.m
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 16/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "SelectEDTController.h"
#import "EtudiantController.h"
#import "SlidableView.h"
#import "EdtViewController.h"

@interface SelectEDTController ()

@end

@implementation SelectEDTController

@synthesize myEDTName, myEDTCode, topImage, viewAnimates;


- (void) initData{
    // Custom initialization
    myEDTName = [[NSMutableString alloc] init];
    myEDTCode = [[NSMutableString alloc] init];
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {


    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


- (void)viewDidLoad
{
    // Do any additional setup after loading the view.

    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction) selectEDT: (UIButton *) sender{
    //[myButtonBack setEnabled:NO];
    int codeEDT = (int) sender.tag;
    // SRC1 SRC2 LP%
    if(codeEDT ==0){
        [myEDTName setString:  @"SRC 1"];
        [myEDTCode setString:@"50764,50765,50766,50767"];
    }else if (codeEDT==1){
        [myEDTName setString:  @"SRC 2"];
        [myEDTCode setString:@"63080,63081,63082,63083"];
    }else if(codeEDT==2){
        [myEDTName setString:  @"LP CDG"];
        [myEDTCode setString:@"109585,109586"];
    }else if(codeEDT==4){
        [myEDTName setString:  @"TECAM "];
        [myEDTCode setString:@"109587,124441"];
    }
    // Info1 Info2 LPs
    else if(codeEDT==5){
        [myEDTName setString:  @"Info 1"];
        [myEDTCode setString:@"48488,48489,48490,48491"];
        [self performSegueWithIdentifier:@"visuedt" sender:self];
    }    else if(codeEDT==6){
        [myEDTName setString:  @"Info 2"];
        [myEDTCode setString:@"60448,60449,60450,60451"];
    } else if(codeEDT==7){
        [myEDTName setString:  @"LP IMM"];
        [myEDTCode setString:@"59050,59051,59052,59054,59055,59056,59058,59059,59062,59063,59064,59066,59067,59068,59070,59487,59488,59490,59491,59492,59494,59495,59496,59498,59499,59500,59503,59504,59505,59507,59508,59509,59511,59512,59513,59515,59516,59517,59519,59520,59521,59523,59524,59525"];
    }else if(codeEDT==8){
        [myEDTName setString:  @"LP ISN"];
        [myEDTCode setString:@"47338,47339"];
    }
    // GEII 1 2  LPs
    else if(codeEDT==9){
        [myEDTName setString:  @"LP GEII 1"];
        [myEDTCode setString:@"51584,51585,51586,51638"];
    }
    else if(codeEDT==10){
        [myEDTName setString:  @"GEII 2"];
        [myEDTCode setString:@"59678,59679,59680,59681"];
    }else if(codeEDT==11){
        [myEDTName setString:  @"LP A2I"];
        [myEDTCode setString:@"47958,47959"];

    }
    [self performSegueWithIdentifier:@"visuedt" sender:self];
}



- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
    
//    UIView * previousView = [(UIViewController<SlidableView> *)[self presentingViewController] viewAnimates];
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
//                         
//                     }];
//    
}
//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"visuedt"]) {
        EdtViewController *destViewController = segue.destinationViewController;
        destViewController.edtID = myEDTCode;

        [destViewController loadView];
        
        
    }
    
}

- (BOOL )shouldAutorotate{
    return NO;
    
}



@end
