//
//  RootViewController.m
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 14/12/12.
//  Copyright (c) 2012 Damien Bannerot. All rights reserved.
//

#import "RootViewController.h"
#import "News.h"
#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "Utils.h"

@interface RootViewController ()

@end

@implementation RootViewController
@synthesize tabNews;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    self.tabNews = [[NSMutableArray alloc] init];
    //NSDictionary *dictFromFile = [[NSDictionary alloc]initWithContentsOfFile:path];
    NSString *urlxml=[NSString stringWithFormat:@"http://iutsd.applorraine.fr/%@.plist", [Utils getDeviceID]];
    NSArray *contenuTableauPlist = [[NSArray alloc] initWithContentsOfURL:[NSURL URLWithString:urlxml]];
    for (NSDictionary *dict in contenuTableauPlist){
        //NSString *titre = [dict objectForKey:@"titre"];
        News *ws = [[News alloc]initWithDictionaryFromPlist:dict];
        //self.tabNews = [NSMutableArray arrayWithArray:dictionaryToAdd];
        [tabNews addObject:ws];
    }
    
    // NSArray *arrayFromFile = [dictFromFile objectForKey:@"Root"];
    // NSLog(@"toto");
    //NSMutableArray *dictionaryToAdd = [[NSMutableArray alloc]init];
    //NSEnumerator *enumerator = [arrayFromFile objectEnumerator];
    //NSDictionary *anObject;
    //int k=1;
    //    while((anObject=[enumerator nextObject])){
    //        NSLog(@"passage:%i", k);
    //        k++;
    //        News *ws = [[News alloc]initWithDictionaryFromPlist:anObject];
    //        [dictionaryToAdd addObject:ws];
    //        [ws release];
    //    }
    //
    
    //
    //[dictionaryToAdd release];
    //[arrayFromFile release];
    
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.tabNews count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier /*forIndexPath:indexPath*/];
    
    // Configure the cell...
    if(cell==nil){
        cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    News *ws = [self.tabNews objectAtIndex:[indexPath row]];
    
    cell.textLabel.text=ws.newsTitre;
    cell.detailTextLabel.text=ws.newsDescription;
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    //UIViewController *txtlabel = [[UIViewController alloc] initWithNibName:@"okok" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    //     [self.navigationController pushViewController:detailView animated:YES];
    //    [self.navigationController presentingViewController:  popToRootViewControllerAnimated:YES];// detailView animated:YES completion:NULL];
    //  [self.parentViewController  pushViewController:detailView animated:YES];
    
    //    UIStoryboard *iphone= [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    //    DetailViewController *controller= [iphone instantiateViewControllerWithIdentifier:@"test"];
    //    [[controller titre]setText:@"toto"];
    News *ws = [self.tabNews objectAtIndex:[indexPath row]];
    
    
    
    newsCurrentTitle=ws.newsTitre;
    newsCurrentContent=ws.newsContenu;
    [self performSegueWithIdentifier:@"detailNews" sender:self];
    
    
    //[detailView
    // [DetailViewController release];
    
}

-(NSString *)getCurrentNewsTitle{
    return newsCurrentTitle;
}
-(NSString *)getCurrentNewsContent{
    return newsCurrentContent;
}

@end
