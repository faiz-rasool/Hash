//
//  Tweet.m
//  Hash
//
//  Created by ASpple on 04/03/2015.
//  Copyright (c) 2015 NXB. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (instancetype)initWithDictionary:(NSDictionary*)status{
    
    self = [super init];
    
    if (self) {
        self.text = NULL_TO_EMPTY([status valueForKey:@"text"]);
        self.screenName = NULL_TO_EMPTY([status valueForKeyPath:@"user.screen_name"]);
        self.createdAt = NULL_TO_EMPTY([status valueForKey:@"created_at"]);
        self.profileImage = NULL_TO_EMPTY([status valueForKeyPath:@"user.profile_image_url"]);

    }
    
    return self;
}
@end
