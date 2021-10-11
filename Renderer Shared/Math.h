//
//  Math.h
//  Renderer
//
//  Created by Jack Elliott on 10/9/21.
//

#ifndef Math_h
#define Math_h

@interface Math : NSObject

+ (NSUInteger) AlignUpWithMask : (NSUInteger) value : (NSUInteger) mask;
+ (NSUInteger) AlignDownWithMask : (NSUInteger) value : (NSUInteger) mask;
+ (NSUInteger) AlignUp : (NSUInteger) value : (NSUInteger) alignment;
+ (NSUInteger) AlignDown : (NSUInteger) value : (NSUInteger) alignment;

@end

#endif /* Math_h */
