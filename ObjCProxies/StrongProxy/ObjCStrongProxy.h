//
//  ObjCStrongProxy.h
//  ObjCProxies
//
//  Created by WeZZard on 02/03/2017.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjCStrongProxy : NSProxy
/**
 The proxy target.
 */
@property (nonatomic, readonly) id target;

/**
 Creates a new strong proxy for target.
 
 @param target Target object.
 
 @return A new proxy object.
 */
- (instancetype)initWithTarget:(id)target;

/**
 Creates a new strong proxy for target.
 
 @param target Target object.
 
 @return A new proxy object.
 */
+ (__kindof ObjCStrongProxy *)proxyWithTarget:(id)target;

- (void)forwardInvocation:(NSInvocation *)invocation;

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector;

- (NSString *)description;

- (NSString *)debugDescription;
@end

NS_ASSUME_NONNULL_END
