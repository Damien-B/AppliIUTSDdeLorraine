//
//  IUTLocation.m
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 20/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import "IUTLocation.h"

@implementation IUTLocation

@synthesize coordinate;

-(id)initWithCoordinate{
    CLLocationCoordinate2D coord;
    coord.latitude=48.290021;
    coord.longitude= 6.942775;
    coordinate = coord;
    return self;
}

- (NSString *)title{
    return @"IUT de Saint Dié";
}

- (NSString *)subtitle{
    return @"Sous-titre du lieu";
}

@end
