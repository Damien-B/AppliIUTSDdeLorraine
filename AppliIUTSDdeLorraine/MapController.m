//
//  MapController.m
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 18/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "MapController.h"
#import "Utils.h"
@interface MapController ()

@end

@implementation MapController
@synthesize mapview;


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
    [self location];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)setMap:(id)sender{
    
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            mapview.mapType = MKMapTypeStandard;
            break;
        case 1:
            mapview.mapType = MKMapTypeSatellite;
            break;
        case 2:
            mapview.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }
    
}

- (void) location{
    
    MKCoordinateRegion region;
    region.center.latitude = 48.290021;
    region.center.longitude = 6.942775;
    region.span.latitudeDelta = 0.01;
    region.span.longitudeDelta = 0.01;
    [self.mapview setRegion:region animated:YES];
    
    IUTLocation *annotationIUT =[[IUTLocation alloc] initWithCoordinate];
    [mapview addAnnotation:annotationIUT];
   
    
}
- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id <MKAnnotation> mp = [annotationView annotation];
    if (![mp isKindOfClass:[MKUserLocation class]])
    {
        [mv selectAnnotation:mp animated:YES];
    }
}
- (MKAnnotationView *) mapView:(MKMapView *) mapView viewForAnnotation:(id ) annotation {
	if ([annotation isKindOfClass:[IUTLocation class]]){
    
    MKPinAnnotationView *customAnnotationView=[[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil] autorelease];
//    customAnnotationView.pinColor = MKPinAnnotationColorPurple;

    UIImageView *leftIconView = [[UIImageView alloc] initWithImage:[Utils imageWithImage:[UIImage imageNamed:@"logoIUT.jpeg"] scaledToSize:CGSizeMake(30.0f,30.0f)]];
    customAnnotationView.leftCalloutAccessoryView =  leftIconView;
    customAnnotationView.canShowCallout = YES;
    return customAnnotationView;
    }
    return  nil;
}

- (IBAction)getlocation{
    
    mapview.showsUserLocation = YES;
    
    
    
    
}


- (IBAction)back:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}




@end
