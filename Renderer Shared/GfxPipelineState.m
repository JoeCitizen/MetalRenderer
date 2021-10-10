//
//  PipelineState.m
//  Renderer
//
//  Created by Jack Elliott on 10/8/21.
//

#import <Foundation/Foundation.h>
#import "Device.h"
#import "GfxPipelineState.h"


@implementation GfxPipelineState

-(nonnull instancetype) init :(Device*) device : (nonnull NSString*) name
{
    self = [super init];
    if(self)
    {
        self->__device = device;
        self->__name = name;
        
        [self setDefaultValues];
    }

    return self;
}

-(void) setDefaultValues
{
    __desc = [[MTLRenderPipelineDescriptor alloc] init];
    __desc.sampleCount = 1;
    __desc.label = __name;
}

-(void) compile
{
    id<MTLDevice> device = __device._mtlDevice;
    
    id<MTLLibrary> defaultLibrary = [device newDefaultLibrary];

    id <MTLFunction> vertexFunction = [defaultLibrary newFunctionWithName:__vertexShader];
    __desc.vertexFunction = vertexFunction;

    if(__pixelShader != nil)
    {
        id <MTLFunction> pixelFunction = [defaultLibrary newFunctionWithName:__pixelShader];
        __desc.fragmentFunction = pixelFunction;
    }
    
    NSError *error = NULL;
    
    __pso = [device newRenderPipelineStateWithDescriptor:__desc error:&error];
    if (!__pso)
    {
        NSLog(@"Failed to created pipeline state, error %@", error);
    }
    
}

@end
