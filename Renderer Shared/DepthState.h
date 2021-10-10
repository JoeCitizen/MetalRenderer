//
//  DepthState.h
//  Renderer
//
//  Created by Jack Elliott on 10/9/21.
//

#ifndef DepthState_h
#define DepthState_h
#import "Common.h"

@class Device;

@interface DepthState : NSObject

-(nonnull instancetype) init : (Device*) device;

-(void) create;

@property MTLDepthStencilDescriptor* _desc;

@property (readonly) Device* _device;

@property id <MTLDepthStencilState> _depthState;

@end

#endif /* DepthState_h */
