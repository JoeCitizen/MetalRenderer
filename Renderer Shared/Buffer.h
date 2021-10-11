//
//  Buffer.h
//  Renderer
//
//  Created by Jack Elliott on 10/9/21.
//

#ifndef Buffer_h
#define Buffer_h
#import "Common.h"

@class Device;

@interface Buffer : NSObject

-(nonnull instancetype) initShared :(Device*) device : (NSUInteger) length : (nonnull NSString*) name;

@property Device* _device;

@property id <MTLBuffer> _mtlBuffer;
@end

#endif /* Buffer_h */
