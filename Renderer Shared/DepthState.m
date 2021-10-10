//
//  DepthState.m
//  Renderer
//
//  Created by Jack Elliott on 10/9/21.
//

#import <Foundation/Foundation.h>
#import "DepthState.h"

@implementation DepthState

-(nonnull instancetype) init : (Device*) device
{
    self = [super init];
    if(self)
    {
        self->__device = device;
        
        [self setDefaultValues];
    }

    return self;
}

-(void) setDefaultValues
{
    __desc = [[MTLDepthStencilDescriptor alloc] init];
    __desc.depthCompareFunction = MTLCompareFunctionLess;
    __desc.depthWriteEnabled = YES;
}

-(void) create
{
    id<MTLDevice> device = __device._mtlDevice;
    
    __depthState = [device newDepthStencilStateWithDescriptor:__desc];
}

@end
