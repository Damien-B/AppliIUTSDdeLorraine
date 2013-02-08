//
//  SRC1ViewController.m
//  AppliIUTSDdeLorraine
//
//  Created by B2IB on 08/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "SRC1ViewController.h"

@interface SRC1ViewController ()

@end

@implementation SRC1ViewController

@synthesize webEdt;
@synthesize next;
@synthesize before;

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
    self.webEdt = [[[UIWebView alloc]
                    initWithFrame:CGRectMake(0, 40, 320, 380)] autorelease];
    
    NSError *error = nil;
    NSURL *urlmaj = [NSURL URLWithString:@"http://kerrecherche.iutsd.uhp-nancy.fr/AppliIUTSDdeLorraine/idEDT.php"];
    NSString *maj = [NSString stringWithContentsOfURL:urlmaj encoding:NSUTF8StringEncoding error:&error];
    
    NSURL *urlweek = [NSURL URLWithString:@"http://iutsd.applorraine.fr/week.php"];
    
    NSString *week = [NSString stringWithContentsOfURL:urlweek encoding:NSUTF8StringEncoding error:&error];
    
    NSString *day = @"0%2C1%2C2%2C3%2C4%2C5";
    
    NSString *Tree = @"5928%2C5930%2C5925%2C5926";
    
    
    
    NSString *urlAddress = [NSString stringWithFormat:@"http://adeweb.uhp-nancy.fr/jsp/imageEt?identifier=%@&projectId=5&idPianoWeek=%@&idPianoDay=%@&idTree=%@&width=800&height=420&lunchName=REPAS&displayMode=1057855&showLoad=false&ttl=1253016797184&displayConfId=126", maj, week, day, Tree];
    NSURL *url = [[[NSURL alloc] initWithString:urlAddress] autorelease];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [self.webEdt loadRequest:requestObj];
    
    [self.view addSubview:self.webEdt];
}

- (IBAction) next: (UIBarButtonItem *) sender{
    self.webEdt = [[[UIWebView alloc]
                    initWithFrame:CGRectMake(0, 40, 320, 380)] autorelease];
    
     NSError *error = nil;

   
    
    NSURL *urlweekmore = [NSURL URLWithString:@"http://iutsd.applorraine.fr/weekmore.php"];
    
    NSString *weekmore = [NSString stringWithContentsOfURL:urlweekmore encoding:NSUTF8StringEncoding error:&error];
    
    NSURL *urlmaj = [NSURL URLWithString:@"http://kerrecherche.iutsd.uhp-nancy.fr/AppliIUTSDdeLorraine/idEDT.php"];
    NSString *maj = [NSString stringWithContentsOfURL:urlmaj encoding:NSUTF8StringEncoding error:&error];
    
    NSString *day = @"0%2C1%2C2%2C3%2C4%2C5";
    
    NSString *Tree = @"5928%2C5930%2C5925%2C5926";
    
    NSString *urlAddress = [NSString stringWithFormat:@"http://adeweb.uhp-nancy.fr/jsp/imageEt?identifier=%@&projectId=5&idPianoWeek=%@&idPianoDay=%@&idTree=%@&width=800&height=420&lunchName=REPAS&displayMode=1057855&showLoad=false&ttl=1253016797184&displayConfId=126", maj, weekmore, day, Tree];
    NSURL *url = [[[NSURL alloc] initWithString:urlAddress] autorelease];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [self.webEdt loadRequest:requestObj];
    
    [self.view addSubview:self.webEdt];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
