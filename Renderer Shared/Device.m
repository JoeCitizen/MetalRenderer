//
//  Device.m
//  Renderer
//
//  Created by Jack Elliott on 10/8/21.
//

#import <Foundation/Foundation.h>
#import "Device.h"

@implementation Device

-(nonnull instancetype) initFromView :(nonnull MTKView *)view;
{
    self = [super init];
    if(self)
    {
        self->__mtlDevice = view.device;
        [self initialize];
    }

    return self;
}

-(void) initialize
{
    __mtlCommandQueue = [__mtlDevice newCommandQueue];
}


@end
