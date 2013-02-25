//
//  MapController.h
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 18/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "IUTLocation.h"
#import "SlidableView.h"


@interface MapController : UIViewController<SlidableView>{
    IBOutlet MKMapView *mapview;
    IBOutlet UIImageView *topImage;
    IBOutlet UIView *viewAnimates;
    IUTLocation *annotationIUT;
    UIImageView *leftIconView;
    MKPinAnnotationView *customAnnotationView;
}


@property (nonatomic, retain) IBOutlet MKMapView *mapview;

@property (nonatomic, retain) IBOutlet UIView *viewAnimates;
@property (nonatomic, retain) IBOutlet UIImageView *topImage;

- (IBAction)setMap:(id)sender;
- (IBAction)getlocation;
- (IBAction)back:(id)sender;
- (void) location;

@end
