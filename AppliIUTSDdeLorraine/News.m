//
//  News.m
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 14/12/12.
//  Copyright (c) 2012 Damien Bannerot. All rights reserved.
//

#import "News.h"

@implementation News

@synthesize newsTitre;
@synthesize newsDescription;

- (id) initWithDictionaryFromPlist: (NSDictionary *) dictionary {
    [self init];
    
    self.newsTitre=[dictionary objectForKey:@"titre"];
    self.newsDescription=[dictionary objectForKey:@"description"];
    return self;
}

- (void)dealloc {
    [newsTitre release];
    [newsDescription release];
    [super dealloc];
}

@end
