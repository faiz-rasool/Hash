//
//  IGMedia.m
//  Hash
//
//  Created by ASpple on 04/03/2015.
//  Copyright (c) 2015 NXB. All rights reserved.
//

#import "IGMedia.h"

@implementation IGMedia

+ (id) entityWithDictionary:(NSDictionary *)dictionary{
    
    IGMedia* entity = [[IGMedia alloc] init];
    entity.mediaId = dictionary[@"id"];
//    entity.images = [SBInstagramMediaEntity imagesWithDictionary:dictionary[@"images"]];
    entity.caption = (![dictionary[@"caption"] isKindOfClass:[NSNull class]])?(dictionary[@"caption"])[@"text"]:@"";
    entity.userName = dictionary[@"user"][@"username"];
    entity.profilePicture = dictionary[@"user"][@"profile_picture"];
    entity.createdTime = [NSDate dateWithTimeIntervalSince1970:[dictionary[@"created_time"] longLongValue]];
    
    return entity;
}


@end
