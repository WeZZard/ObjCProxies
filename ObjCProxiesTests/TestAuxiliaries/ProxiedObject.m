//
//  ProxiedObject.m
//  ObjCProxies
//
//  Created by WeZZard on 17/10/2018.
//

#import "ProxiedObject.h"

@implementation ProxiedObject
- (instancetype)init {
    self = [super init];
    if (self) {
        _hasInvoked = NO;
    }
    return self;
}

- (BOOL)hasInvoked {
    return _hasInvoked;
}

- (void)invoke {
    _hasInvoked = YES;
}
@end
