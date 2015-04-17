//
//  IGMedia.h
//  Hash
//
//  Created by ASpple on 04/03/2015.
//  Copyright (c) 2015 NXB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IGMedia : NSObject

@property (nonatomic, strong) NSString *mediaId;
@property (nonatomic, strong) NSMutableDictionary *images;
@property (nonatomic, strong) NSMutableDictionary *videos;
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *profilePicture;
@property (nonatomic, strong) NSDate *createdTime;
@property (nonatomic, assign) int likesCount;
@property (nonatomic, strong) NSMutableArray *likers;

+ (id) entityWithDictionary:(NSDictionary *)dictionary;



@end
