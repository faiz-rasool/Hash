//
//  Tweet.h
//  Hash
//
//  Created by ASpple on 04/03/2015.
//  Copyright (c) 2015 NXB. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NULL_TO_EMPTY(obj)  obj == [NSNull null] ? @"": obj

@interface Tweet : NSObject

@property (nonatomic, strong) NSString * text;
@property (nonatomic, strong) NSString * screenName;
@property (nonatomic, strong) NSString * createdAt;
@property (nonatomic, strong) NSString * profileImage;


- (instancetype)initWithDictionary:(NSDictionary*)status;

@end
