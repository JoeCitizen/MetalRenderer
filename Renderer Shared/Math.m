//
//  Math.m
//  Renderer
//
//  Created by Jack Elliott on 10/9/21.
//

#import <Foundation/Foundation.h>
#import "Math.h"

@implementation Math

+ (NSUInteger) AlignUpWithMask : (NSUInteger) value : (NSUInteger) mask
{
    return ((value + mask) & ~mask);
}

+ (NSUInteger) AlignDownWithMask : (NSUInteger) value : (NSUInteger) mask
{
    return (value & ~mask);
}

+ (NSUInteger) AlignUp : (NSUInteger) value : (NSUInteger) alignment
{
    return [Math AlignUpWithMask : value : (alignment - 1)];
}

+ (NSUInteger) AlignDown : (NSUInteger) value : (NSUInteger) alignment
{
    return [Math AlignDownWithMask : value : (alignment - 1)];
}

@end

