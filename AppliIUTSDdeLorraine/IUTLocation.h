//
//  IUTLocation.h
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 20/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface IUTLocation : NSObject<MKAnnotation>{
    CLLocationCoordinate2D coordinate;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
- (id)initWithCoordinate;

- (NSString *)subtitle;
- (NSString *)title;
@end
