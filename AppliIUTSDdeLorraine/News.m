//
//  News.m
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 14/12/12.
//  Copyright (c) 2012 Damien Bannerot. All rights reserved.
//

#import "News.h"

@implementation News

@synthesize newsTitre, newsDescription,newsContenu;

- (id) initWithDictionaryFromPlist: (NSDictionary *) dictionary {
    [self init];
    
    self.newsTitre=[dictionary objectForKey:@"titre"];
    self.newsDescription=[dictionary objectForKey:@"description"];
    self.newsContenu=[dictionary objectForKey:@"contenu"];
    NSLog(@"contenu : %@", newsContenu);
    return self;
}

- (void)dealloc {
    [newsTitre release];
    [newsDescription release];
    [newsContenu release];
    [super dealloc];
}

@end
