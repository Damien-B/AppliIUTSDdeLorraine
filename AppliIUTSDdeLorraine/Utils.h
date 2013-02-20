//
//  Utils.h
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 02/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject



+ (bool) detectConnectivityFromHostName: (NSString *) hostname ;

+ (NSString *) getDeviceID ;

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize ;

@end
