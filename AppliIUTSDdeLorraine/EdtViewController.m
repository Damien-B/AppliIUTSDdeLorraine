//
//  EdtViewController.m
//  AppliIUTSDdeLorraine
//
//  Created by B2IB on 05/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "EdtViewController.h"

@interface EdtViewController ()

@end


@implementation EdtViewController

@synthesize imgEdt;
@synthesize src1;
@synthesize src2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction) src1 : (UIButton *) sender{
//    self.imgEdt = [[[UIWebView alloc]
//                    initWithFrame:CGRectMake(0, 40, 320, 420)] autorelease];
//    
//    NSError *error = nil;
//    NSURL *urlmaj = [NSURL URLWithString:@"http://kerrecherche.iutsd.uhp-nancy.fr/AppliIUTSDdeLorraine/idEDT.txt"];
//    NSString *maj = [NSString stringWithContentsOfURL:urlmaj encoding:NSUTF8StringEncoding error:&error];
//    
//    NSString *day = @"0%2C1%2C2%2C3%2C4%2C5";
//    
//    NSString *Tree = @"5928%2C5930%2C5925%2C5926";
//    
//    NSString *urlAddress = [NSString stringWithFormat:@"http://adeweb.uhp-nancy.fr/jsp/imageEt?identifier=3aa6d382b3c564d284158007b0d613c8&projectId=5&idPianoWeek=23&idPianoDay=%@&idTree=%@&width=800&height=420&lunchName=REPAS&displayMode=1057855&showLoad=false&ttl=1253016797184&displayConfId=126", day, Tree];
//    NSURL *url = [[[NSURL alloc] initWithString:urlAddress] autorelease];
//    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//    
//    [self.imgEdt loadRequest:requestObj];
//    
//    [self.view addSubview:self.imgEdt];
//}

- (IBAction) src2 : (UIButton *) sender{
   // self.imgEdt = [[[UIImageView alloc]
     //               initWithFrame:CGRectMake(0, 40, 640, 420)] autorelease];
    
   // self.scroll = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, 320, 420)] autorelease];
    
    NSError *error = nil;
   
    
    NSString *urlAddress = @"http://kerrecherche.iutsd.uhp-nancy.fr/AppliIUTSDdeLorraine/SRC1.gif";
    urlAddress= [urlAddress stringByReplacingOccurrencesOfString:@"!"withString:@"%%"];
    NSLog(urlAddress);
    NSURL *url = [[[NSURL alloc] initWithString:urlAddress] autorelease];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    NSHTTPURLResponse *response=nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:requestObj returningResponse:&response error: &error];
    //NSLog(@"errr=%@",[error debugDescription description]);

    [self.imgEdt setImage:  [UIImage imageWithData: data]];
    
    //[self.scroll addSubview: imgEdt];
    //[self.view addSubview: scroll];

}

- (IBAction) close: (UIBarButtonItem *) sender{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}






@end