//
//  Buffer.m
//  Renderer
//
//  Created by Jack Elliott on 10/9/21.
//

#import <Foundation/Foundation.h>
#import "Buffer.h"

@implementation Buffer

-(nonnull instancetype) initShared :(Device*) device : (NSUInteger) length : (nonnull NSString*) name
{
    self = [super init];
    if(self)
    {
        self->__device = device;
        
        id<MTLDevice> mtlDevice = device._mtlDevice;
        
        self->__mtlBuffer = [mtlDevice newBufferWithLength:length options:  MTLResourceStorageModeShared];
        
        self->__mtlBuffer.label = name;
    }

    return self;
}

@end
