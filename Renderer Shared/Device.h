//
//  Device.h
//  Renderer
//
//  Created by Jack Elliott on 10/8/21.
//

#ifndef Device_h
#define Device_h

#import "Common.h"

@interface Device : NSObject

-(nonnull instancetype) initFromView :(nonnull MTKView *)view;

@property id<MTLDevice> _mtlDevice;
@property id<MTLCommandQueue> _mtlCommandQueue;

@end

#endif /* Device_h */
