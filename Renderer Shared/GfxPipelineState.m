//
//  PipelineState.m
//  Renderer
//
//  Created by Jack Elliott on 10/8/21.
//

#import <Foundation/Foundation.h>
#import "Device.h"
#import "GfxPipelineState.h"
#import "ShaderTypes.h"


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
    
    __vertexDescType = VertexDescPosition3Texcoord2;
}

-(MTLVertexDescriptor *) getMtlVertexDesc : (VertexDescType) variant
{
    MTLVertexDescriptor* desc = [[MTLVertexDescriptor alloc] init];
    
    switch(variant)
    {
        case VertexDescPosition3Texcoord2:
        {
            desc.attributes[VertexAttributePosition].format = MTLVertexFormatFloat3;
            desc.attributes[VertexAttributePosition].offset = 0;
            desc.attributes[VertexAttributePosition].bufferIndex = BufferIndexMeshPositions;

            desc.attributes[VertexAttributeTexcoord].format = MTLVertexFormatFloat2;
            desc.attributes[VertexAttributeTexcoord].offset = 0;
            desc.attributes[VertexAttributeTexcoord].bufferIndex = BufferIndexMeshGenerics;

            desc.layouts[BufferIndexMeshPositions].stride = 12;
            desc.layouts[BufferIndexMeshPositions].stepRate = 1;
            desc.layouts[BufferIndexMeshPositions].stepFunction = MTLVertexStepFunctionPerVertex;

            desc.layouts[BufferIndexMeshGenerics].stride = 8;
            desc.layouts[BufferIndexMeshGenerics].stepRate = 1;
            desc.layouts[BufferIndexMeshGenerics].stepFunction = MTLVertexStepFunctionPerVertex;
            break;
        }
        default:
            break;
    }
    
    return desc;
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
    
    __desc.vertexDescriptor = [self getMtlVertexDesc:(__vertexDescType)];
    
    NSError *error = NULL;
    
    __pso = [device newRenderPipelineStateWithDescriptor:__desc error:&error];
    if (!__pso)
    {
        NSLog(@"Failed to created pipeline state, error %@", error);
    }
}

@end
