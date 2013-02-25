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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   myEDTName = [[NSMutableString alloc] init];
   myEDTCode = [[NSMutableString alloc] init];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction) selectEDT: (UIButton *) sender{
    //[myButtonBack setEnabled:NO];
    int codeEDT = sender.tag;
    // SRC1 SRC2 LP
    if(codeEDT ==0){
        [myEDTName setString:  @"SRC 1"];
        [myEDTCode setString:@"5971%2C5973%2C5967%2C5968"];
        [self performSegueWithIdentifier:@"visuedt" sender:self];
    }else if (codeEDT==1){
        [myEDTName setString:  @"SRC 2"];
        [myEDTCode setString:@"5928%2C5930%2C5925%2C5926"];
        [self performSegueWithIdentifier:@"visuedt" sender:self];
    }else if(codeEDT==2){
        [myEDTName setString:  @"LP CDG"];
        [myEDTCode setString:@"5978"];
        [self performSegueWithIdentifier:@"visuedt" sender:self];

    }else if(codeEDT==3){
        [myEDTName setString:  @"LP CMPM"];
        [myEDTCode setString:@"5980"];
        [self performSegueWithIdentifier:@"visuedt" sender:self];

    }else if(codeEDT==4){
        [myEDTName setString:  @"TECAM "];
        [myEDTCode setString:@"5976"];
        [self performSegueWithIdentifier:@"visuedt" sender:self];

    }
     // Info1 Info2 LPs
    else if(codeEDT==5){
        [myEDTName setString:  @"Info 1"];
        [myEDTCode setString:@"5921%2C5957%2C5958%2C5960"];
        [self performSegueWithIdentifier:@"visuedt" sender:self];
    }    else if(codeEDT==6){
        [myEDTName setString:  @"Info 2"];
        [myEDTCode setString:@"5941%2C5942%2C5944%2C5945"];
        [self performSegueWithIdentifier:@"visuedt" sender:self];
    } else if(codeEDT==7){
        [myEDTName setString:  @"LP IMM"];
        [myEDTCode setString:@"5933"];
        [self performSegueWithIdentifier:@"visuedt" sender:self];
    }else if(codeEDT==8){
        [myEDTName setString:  @"LP ISN"];
        [myEDTCode setString:@"6547"];
        [self performSegueWithIdentifier:@"visuedt" sender:self];
    }
    // GEII 1 2  LPs
    else if(codeEDT==9){
        [myEDTName setString:  @"LP GEII 1"];
        [myEDTCode setString:@"5666%2C6441%2C5950%2C5953"];
        [self performSegueWithIdentifier:@"visuedt" sender:self];
    }
    else if(codeEDT==10){
        [myEDTName setString:  @"GEII 2"];
        [myEDTCode setString:@"5969%2C5972%2C5977%2C5979"];
        [self performSegueWithIdentifier:@"visuedt" sender:self];
    }else if(codeEDT==11){
        [myEDTName setString:  @"LP A2I"];
        [myEDTCode setString:@"5962%2C5963"];
        [self performSegueWithIdentifier:@"visuedt" sender:self];
    }
    
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepare seguee EDT....!:%@",segue.identifier);
    if ([segue.identifier isEqualToString:@"visuedt"]) {
        EdtViewController *destViewController = segue.destinationViewController;
        [destViewController loadView];
        
    }
}



@end
