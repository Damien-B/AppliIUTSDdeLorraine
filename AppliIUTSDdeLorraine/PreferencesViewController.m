//
//  PreferencesViewController.m
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 12/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "PreferencesViewController.h"
#import "Utils.h"

@interface PreferencesViewController ()

@end

@implementation PreferencesViewController

@synthesize edt, retour;
@synthesize pedagogie;
@synthesize general;
@synthesize divertissement;
@synthesize covoiturage;
@synthesize prefsend;
@synthesize strResult;

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
    NSString *url = [NSString stringWithFormat:@"http://iutsd.applorraine.fr/aboload.php?uuid=%@", [Utils getDeviceID]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1.0];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(connection){
        NSLog(@"requete pour affichage des abo envoyee");
    }else{
        NSLog(@"not connected");
    }
    NSError *e;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&e];
    strResult = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"data reçu:%@", strResult);
    if([strResult isEqual:@"1"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:NO animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:NO animated:YES];
    }else if([strResult isEqual:@"2"]){
        [edt setOn:NO animated:YES];
        [pedagogie setOn:YES animated:YES];
        [general setOn:NO animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:NO animated:YES];
    }else if([strResult isEqual:@"3"]){
        [edt setOn:NO animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:NO animated:YES];
    }else if([strResult isEqual:@"4"]){
        [edt setOn:NO animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:NO animated:YES];
        [divertissement setOn:YES animated:YES];
        [covoiturage setOn:NO animated:YES];
    }else if([strResult isEqual:@"5"]){
        [edt setOn:NO animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:NO animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:YES animated:YES];
    }else if([strResult isEqual:@"12"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:YES animated:YES];
        [general setOn:NO animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:NO animated:YES];
    }else if([strResult isEqual:@"13"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:NO animated:YES];
    }else if([strResult isEqual:@"14"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:NO animated:YES];
        [divertissement setOn:YES animated:YES];
        [covoiturage setOn:NO animated:YES];
    }else if([strResult isEqual:@"15"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:NO animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:YES animated:YES];
    }else if([strResult isEqual:@"23"]){
        [edt setOn:NO animated:YES];
        [pedagogie setOn:YES animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:NO animated:YES];
    }else if([strResult isEqual:@"24"]){
        [edt setOn:NO animated:YES];
        [pedagogie setOn:YES animated:YES];
        [general setOn:NO animated:YES];
        [divertissement setOn:YES animated:YES];
        [covoiturage setOn:NO animated:YES];
    }else if([strResult isEqual:@"25"]){
        [edt setOn:NO animated:YES];
        [pedagogie setOn:YES animated:YES];
        [general setOn:NO animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:YES animated:YES];
    }else if([strResult isEqual:@"34"]){
        [edt setOn:NO animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:YES animated:YES];
        [covoiturage setOn:NO animated:YES];
    }else if([strResult isEqual:@"35"]){
        [edt setOn:NO animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:YES animated:YES];
    }else if([strResult isEqual:@"45"]){
        [edt setOn:NO animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:NO animated:YES];
        [divertissement setOn:YES animated:YES];
        [covoiturage setOn:YES animated:YES];
    }else if([strResult isEqual:@"123"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:YES animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:NO animated:YES];
    }else if([strResult isEqual:@"124"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:YES animated:YES];
        [general setOn:NO animated:YES];
        [divertissement setOn:YES animated:YES];
        [covoiturage setOn:NO animated:YES];
    }else if([strResult isEqual:@"125"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:YES animated:YES];
        [general setOn:NO animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:YES animated:YES];
    }else if([strResult isEqual:@"134"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:YES animated:YES];
        [covoiturage setOn:NO animated:YES];
    }else if([strResult isEqual:@"135"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:YES animated:YES];
    }else if([strResult isEqual:@"145"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:NO animated:YES];
        [divertissement setOn:YES animated:YES];
        [covoiturage setOn:YES animated:YES];
    }else if([strResult isEqual:@"234"]){
        [edt setOn:NO animated:YES];
        [pedagogie setOn:YES animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:YES animated:YES];
        [covoiturage setOn:NO animated:YES];
    }else if([strResult isEqual:@"245"]){
        [edt setOn:NO animated:YES];
        [pedagogie setOn:YES animated:YES];
        [general setOn:NO animated:YES];
        [divertissement setOn:YES animated:YES];
        [covoiturage setOn:YES animated:YES];
    }else if([strResult isEqual:@"345"]){
        [edt setOn:NO animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:YES animated:YES];
        [covoiturage setOn:YES animated:YES];
    }else if([strResult isEqual:@"1234"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:YES animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:YES animated:YES];
        [covoiturage setOn:NO animated:YES];
    }else if([strResult isEqual:@"1235"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:YES animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:YES animated:YES];
    }else if([strResult isEqual:@"1245"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:YES animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:YES animated:YES];
    }else if([strResult isEqual:@"1345"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:YES animated:YES];
        [covoiturage setOn:YES animated:YES];
    }else if([strResult isEqual:@"2345"]){
        [edt setOn:NO animated:YES];
        [pedagogie setOn:YES animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:YES animated:YES];
        [covoiturage setOn:YES animated:YES];
    }else if([strResult isEqual:@"12345"]){
        [edt setOn:YES animated:YES];
        [pedagogie setOn:YES animated:YES];
        [general setOn:YES animated:YES];
        [divertissement setOn:YES animated:YES];
        [covoiturage setOn:YES animated:YES];
    }else{
        [edt setOn:NO animated:YES];
        [pedagogie setOn:NO animated:YES];
        [general setOn:NO animated:YES];
        [divertissement setOn:NO animated:YES];
        [covoiturage setOn:NO animated:YES];
    }
    
}
-(IBAction) retour: (UIButton *) sender{
    NSString *url = [NSString stringWithFormat:@"http://iutsd.applorraine.fr/Untitled.php?uuid=%@", [Utils getDeviceID]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1.0];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(connection){
    }
    [self dismissModalViewControllerAnimated:YES];

}

//Envoi de la requete après clic sur le bouton envoi des preferences abonnements
- (IBAction) prefsend: (UIButton *) sender{
    NSString *uuid = [Utils getDeviceID];
    NSString *prefedt;
    NSString *prefpedagogie;
    NSString *prefgeneral;
    NSString *prefdivertissement;
    NSString *prefcovoiturage;
    
    
    if(([edt isOn] == YES)){
        prefedt=@"yes";
    }else{
        prefedt=@"no";
    }
    if(([pedagogie isOn] == YES)){
        prefpedagogie=@"yes";
    }else{
        prefpedagogie=@"no";
    }
    if(([general isOn] == YES)){
        prefgeneral=@"yes";
    }else{
        prefgeneral=@"no";
    }
    if(([divertissement isOn] == YES)){
        prefdivertissement=@"yes";
    }else{
        prefdivertissement=@"no";
    }
    if(([covoiturage isOn] == YES)){
        prefcovoiturage=@"yes";
    }else{
        prefcovoiturage=@"no";
    }
    
    
    NSString *url2 = [NSString stringWithFormat:@"http://iutsd.applorraine.fr/abonnementpref.php?UUId=%@&pref1=%@&pref2=%@&pref3=%@&pref4=%@&pref5=%@", uuid, prefedt, prefpedagogie, prefgeneral, prefdivertissement, prefcovoiturage];
    NSURLRequest *request2 = [NSURLRequest requestWithURL:[NSURL URLWithString:url2] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1.0];
    NSURLConnection *connection2 = [[NSURLConnection alloc] initWithRequest:request2 delegate:self];
    if(connection2){
        NSLog(@"requete pour pref abonnements envoyee; url : %@", url2);
    }else{
        NSLog(@"not connected");
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL )shouldAutorotate{
    return NO;
    
}

@end
