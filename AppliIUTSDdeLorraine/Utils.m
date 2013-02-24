//
//  Utils.m
//  AppliIUTSDdeLorraine
//
//  Created by Kerautret on 02/02/13.
//  Copyright (c) 2013 Damien Bannerot. All rights reserved.
//


#import "Utils.h"
#import <SystemConfiguration/SystemConfiguration.h>
@implementation Utils

+ (NSString *) getDeviceID {
    NSString *userAppID = [[NSUserDefaults standardUserDefaults] objectForKey:@"UIDAppKey"];
    
    if (!userAppID) {
        
        // Create universally unique identifier (object)
        
        CFUUIDRef uuidObject = CFUUIDCreate(NULL);
        
        
        // Get the string representation of CFUUID object.
        
        NSString *uuidStr = (NSString *)CFUUIDCreateString(NULL, uuidObject);
        CFRelease(uuidObject);
        userAppID = [NSString stringWithString:(NSString *) uuidStr];
        
        CFRelease(uuidStr);
        
        [[NSUserDefaults standardUserDefaults] setObject:userAppID forKey:@"UIDAppKey"];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return userAppID;
}


+ (bool) detectConnectivityFromHostName: (NSString *) hostname {
    SCNetworkReachabilityFlags flags;
    BOOL receivedFlags;
    
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(CFAllocatorGetDefault(), [hostname UTF8String]);
    receivedFlags = SCNetworkReachabilityGetFlags(reachability, &flags);
    CFRelease(reachability);
    
    if (!receivedFlags || (flags == 0) )
    {
        return FALSE;
    } else {
		return TRUE;
	}
}
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
