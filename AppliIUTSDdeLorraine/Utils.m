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
