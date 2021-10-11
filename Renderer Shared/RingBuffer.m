//
//  RingBuffer.m
//  Renderer
//
//  Created by Jack Elliott on 10/10/21.
//

#import <Foundation/Foundation.h>
#import "RingBuffer.h"
#import "Buffer.h"

@implementation RingBuffer

-(nonnull instancetype) initShared :(Device*) device : (NSUInteger) length : (nonnull NSString*) name
{
    self = [super init];
    if(self)
    {
        self->__buffer = [[Buffer alloc] initShared : device : length : name];
        self->__ptr = 0;
        self->__size = length;
    }

    return self;
}

-(RingBufferLoc) alloc : (NSUInteger) count : (NSUInteger) alignment
{
    __ptr = [Math AlignUp:__ptr : alignment];
    
    NSUInteger spaceLeft = __size - __ptr;
    
    if(spaceLeft < count || __ptr >= __size)
    {
        __ptr %= __size;
    }
    
    RingBufferLoc loc;
    loc.offset = __ptr;
    loc.pMemory = __buffer._mtlBuffer.contents + __ptr;
    
    return loc;
}

-(id<MTLBuffer>) getMtlBuffer
{
    return __buffer._mtlBuffer;
}

@end
