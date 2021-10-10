//
//  PipelineState.h
//  Renderer
//
//  Created by Jack Elliott on 10/8/21.
//

#ifndef PipelineState_h
#define PipelineState_h
#import "Common.h"

@class Device;

typedef NS_ENUM(NSInteger, VertexDescType)
{
    VertexDescPosition3Texcoord2  = 0,
};


@interface GfxPipelineState : NSObject

-(nonnull instancetype) init :(Device*) device : (nonnull NSString*) name;

-(void) compile;

@property VertexDescType _vertexDescType;
@property (readonly) NSString* _name;
@property (readonly) Device* _device;

@property MTLRenderPipelineDescriptor* _desc;

@property NSString* _vertexShader;
@property NSString* _pixelShader;

@property id<MTLRenderPipelineState> _pso;
@end


#endif /* PipelineState_h */
