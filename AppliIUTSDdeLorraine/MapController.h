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


@interface MapController : UIViewController{
    MKMapView *mapview;

}


@property (nonatomic, retain) IBOutlet MKMapView *mapview;

- (IBAction)setMap:(id)sender;
- (IBAction)getlocation;
- (IBAction)back:(id)sender;

@end
