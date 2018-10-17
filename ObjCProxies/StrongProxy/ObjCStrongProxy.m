//
//  ObjCStrongProxy.m
//  ObjCProxies
//
//  Created by WeZZard on 02/03/2017.
//
//

#import "ObjCStrongProxy.h"

@implementation ObjCStrongProxy
- (instancetype)initWithTarget:(id)target
{
    _target = target;
    return self;
}

+ (__kindof ObjCStrongProxy *)proxyWithTarget:(id)target
{
    return [[ObjCStrongProxy alloc] initWithTarget:target];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:_target];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    return [_target methodSignatureForSelector:selector];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p; Target = %@>",
            NSStringFromClass([self class]),
            self,
            _target != nil ? [_target description] : @"nil"];
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"<%@: %p; Target = %@>",
            NSStringFromClass([self class]),
            self,
            _target != nil ? [_target description] : @"nil"];
}
@end
