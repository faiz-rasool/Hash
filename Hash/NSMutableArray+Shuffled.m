//
//  NSMutableArray+Shuffled.m
//  Hash
//
//  Created by ASpple on 04/03/2015.
//  Copyright (c) 2015 NXB. All rights reserved.
//

#import "NSMutableArray+Shuffled.h"

@implementation NSMutableArray (Shuffled)

- (NSMutableArray *) shuffled
{
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[self count]];
    
    for (id anObject in self)
    {
        NSUInteger randomPos = arc4random()%([tmpArray count]+1);
        [tmpArray insertObject:anObject atIndex:randomPos];
    }
    
    return [NSMutableArray arrayWithArray:tmpArray];  // non-mutable autoreleased copy
}


@end
