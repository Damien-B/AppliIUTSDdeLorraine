//
//  News.h
//  AppliIUTSDdeLorraine
//
//  Created by Damien Bannerot on 14/12/12.
//  Copyright (c) 2012 Damien Bannerot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface News : NSObject{
    NSString *newsTitre;
    NSString *newsDescription;
}
@property (nonatomic, retain) NSString *newsTitre;
@property (nonatomic, retain) NSString *newsDescription;

- (id) initWithDictionaryFromPlist: (NSDictionary *) dictionary;

@end
