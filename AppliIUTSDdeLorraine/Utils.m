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
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef str = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    NSString *string = (NSString *) str;
    NSMutableString *result = [NSMutableString stringWithString: string];
    [string autorelease];
    [result replaceOccurrencesOfString: @"-" withString: @"" options: NSLiteralSearch
                                 range: NSMakeRange(0, [result length]) ];
    return result;
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



@end
