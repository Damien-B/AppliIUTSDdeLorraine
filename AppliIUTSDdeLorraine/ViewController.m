//
//  ViewController.m
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 14/12/12.
//  Copyright (c) 2012 Damien Bannerot. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Utils.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize bconnection;

@synthesize log;
@synthesize mdp;
@synthesize toto;
@synthesize response;
@synthesize authPanel;
@synthesize menuPanel, viewAnimates, topImage, myButtonBack, viewSRC;




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


- (void)viewWillAppear:(BOOL)animated
{
    [myButtonBack setHidden:YES];

}
- (void)viewDidLoad
{
    [myButtonBack setHidden:YES];
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
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) presentAuthPanel: (UIButton *) sender{
    NSLog(@"in animation");
    [myCancelAuthButton setHidden:NO];
    [UIView transitionFromView: menuPanel
                        toView: authPanel
                      duration: 1.0f
                       options:  UIViewAnimationOptionTransitionFlipFromRight
                    completion: ^(BOOL done){
                        [myButtonBack setHidden:NO];

                    }];
}

- (IBAction) returnMenuPanel: (UIButton *) sender{
    NSLog(@"in animation");
    [myCancelAuthButton setHidden:YES];
    
    [UIView transitionFromView: authPanel
                        toView: menuPanel
                      duration: 1.0f
                       options:  UIViewAnimationOptionTransitionFlipFromLeft
                    completion: ^(BOOL done){
                        [myButtonBack setHidden:YES];

                    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepare seguee....!:%@",segue.identifier);
    if ([segue.identifier isEqualToString:@"tabView"]) {
        NSLog(@"for tabView!!!....!");
    }
    //        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    //        RecipeDetailViewController *destViewController = segue.destinationViewController;
    //        destViewController.recipeName = [recipes objectAtIndex:indexPath.row];
    //    }
}



@end
