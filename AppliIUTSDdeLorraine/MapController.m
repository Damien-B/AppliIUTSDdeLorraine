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
@synthesize mapview, viewAnimates, topImage;


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
    
    annotationIUT =[[[IUTLocation alloc] initWithCoordinate] autorelease];
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

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView{
    NSLog(@"startLoading");
}


- (MKAnnotationView *) mapView:(MKMapView *) mapView viewForAnnotation:(id ) annotation {
	if ([annotation isKindOfClass:[IUTLocation class]]){
    
    customAnnotationView= [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil] autorelease];
//    customAnnotationView.pinColor = MKPinAnnotationColorPurple;

    leftIconView = [[[UIImageView alloc] initWithImage:[Utils imageWithImage:[UIImage imageNamed:@"logoIUT.jpeg"] scaledToSize:CGSizeMake(30.0f,30.0f)]]autorelease];
    customAnnotationView.leftCalloutAccessoryView =  leftIconView;
    customAnnotationView.canShowCallout = YES;

        return customAnnotationView;
    }
    return  nil;
}

- (IBAction)getlocation{
    
    mapview.showsUserLocation = YES;
    
    
    
    
}

- (void) dealloc{
    [super dealloc];
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView{
    NSLog(@"all finished!!");
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



@end
