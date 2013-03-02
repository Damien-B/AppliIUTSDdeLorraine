//
//  AuthController.m
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 25/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "AuthController.h"
#import "Utils.h"
#import "EtudiantController.h"

@interface AuthController ()

@end

@implementation AuthController

@synthesize bconnection;

@synthesize log;
@synthesize mdp;
@synthesize toto;
@synthesize response;
@synthesize topImage, viewCover ;

@synthesize viewAnimates;

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
    // Loading user pref
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    BOOL isAutoLogin = [ prefs boolForKey:@"KeyUserAutoLogin" ];
    if(isAutoLogin){
        [log setText: [prefs stringForKey: @"KeyUserName"]];
        [mdp setText: [prefs stringForKey: @"KeyUserPass"]];
        NSLog(@" autolog");
        
    }else{
        NSLog(@"non autolog");
    }
    NSLog(@"Device id (authorized): %@", [Utils getDeviceID]);
    
    // myBadgeMode = [prefs stringForKey: @"keyBadgeInfo"];


}


//Envoi de la requete après clic sur le bouton pour log de l'utilisateur
- (IBAction) bconnection: (UIButton *) sender{
    
    
    // NSString *vallog = log.text;
    //NSString *valmdp = [mdp text];
    
    
    NSString *url = [NSString stringWithFormat:@"http://iutsd.applorraine.fr/testconnexion.php?log=%@&mdp=%@", log.text, mdp.text];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1.0];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(connection){
        NSLog(@"connected");
        toto.text = @"Connexion en cours";
    }else{
        NSLog(@"not connected");
        toto.text = @"Connexion nul";
    }
}

//Envoi de la requete après clic sur le bouton envoi des preferences abonnements


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    
    
    if([response isEqualToString:@"etu"]){
        // NSLog(log.text);
        // toto.text = response;
        // if([log.text isEqualToString:@"iut"]){
        //   if([mdp.text isEqualToString:@"stdie"]){
        [self performSegueWithIdentifier:@"etudiant" sender:self];
        //}
    }
    else if([response isEqualToString:@"prof"]){
        //   if([mdp.text isEqualToString:@"prof"]){
        [self performSegueWithIdentifier:@"professeur" sender:self];
        // }
    }
    else{
        toto.text=@"Login faux, veuillez recommencer.";
    }
    //}
    //else{
    //     NSLog(@"Loose");
    //     toto.text = @"Mauvais Login";
    // }
    
    connection = nil;
    
}


 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    UIView * previousView = [(UIViewController<SlidableView> *)[self presentingViewController] viewAnimates];
   // [[self view] insertSubview: previousView belowSubview: viewAnimates ];
    [UIView animateWithDuration:0.4
                          delay:0.0
                        options:UIViewAnimationOptionTransitionFlipFromTop
                     animations:^{
                         [viewCover setTransform:CGAffineTransformMakeTranslation(0, 0)];
                         
                     }
                     completion:^(BOOL finished){
                         [[(UIViewController<SlidableView> *)[self presentingViewController] view] insertSubview: previousView belowSubview: [(UIViewController<SlidableView>*)[self presentingViewController] topImage] ];
                         [self dismissModalViewControllerAnimated:NO];
                     }];
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"etudiant"]) {
        EtudiantController *destViewController = segue.destinationViewController;
        [destViewController loadView];
        
    }
}

- (BOOL )shouldAutorotate{
    return NO;
    
}


@end
