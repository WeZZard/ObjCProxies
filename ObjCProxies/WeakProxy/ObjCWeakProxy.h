//
//  ObjCWeakProxy.h
//  ObjCProxies
//
//  Created by WeZZard on 02/03/2017.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjCWeakProxy : NSProxy
/**
 The proxy target.
 */
@property (nonatomic, weak, readonly) id _Nullable target;

/**
 Creates a new weak proxy for target.
 
 @param target Target object.
 
 @return A new proxy object.
 */
- (instancetype)initWithTarget:(id)target;

/**
 Creates a new weak proxy for target.
 
 @param target Target object.
 
 @return A new proxy object.
 */
+ (__kindof ObjCWeakProxy *)proxyWithTarget:(id)target;

- (void)forwardInvocation:(NSInvocation *)invocation;

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector;

- (NSString *)description;

- (NSString *)debugDescription;
@end

NS_ASSUME_NONNULL_END
