//
//  RingBuffer.h
//  Renderer
//
//  Created by Jack Elliott on 10/10/21.
//

#ifndef RingBuffer_h
#define RingBuffer_h
#import "Common.h"

@class Buffer;

typedef struct
{
    void* pMemory;
    size_t offset;
}RingBufferLoc;

@interface RingBuffer : NSObject

-(nonnull instancetype) initShared :(Device*) device : (NSUInteger) length : (nonnull NSString*) name;

-(RingBufferLoc) alloc : (NSUInteger) count : (NSUInteger) alignment;

-(id<MTLBuffer>) getMtlBuffer;

@property (readonly) NSUInteger _ptr;
@property (readonly) NSUInteger _size;

@property Buffer* _buffer;

@end

#endif /* RingBuffer_h */
