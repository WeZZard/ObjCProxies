//
//  ObjCWeakProxyTests.m
//  ObjCProxies
//
//  Created by WeZZard on 17/10/2018.
//

#import <XCTest/XCTest.h>

#import <ObjCProxies/ObjCWeakProxy.h>

#import "ProxiedObject.h"

@interface ObjCWeakProxyTests : XCTestCase

@end

@implementation ObjCWeakProxyTests
- (void)testTarget_holds_a_weak_reference {
    ObjCWeakProxy * proxy = nil;
    @autoreleasepool {
        NSObject * object = [[NSObject alloc] init];
        proxy = [[ObjCWeakProxy alloc] initWithTarget: object];
        XCTAssert(proxy.target == object);
    }
    XCTAssert(proxy != nil);
    XCTAssert(proxy.target == nil);
}

- (void)testForwardInvocation {
    ProxiedObject * targetObject = [[ProxiedObject alloc] init];
    ObjCWeakProxy * proxy = [[ObjCWeakProxy alloc] initWithTarget: targetObject];
    
    XCTAssert(!targetObject.hasInvoked);
    XCTAssertNoThrow([(ProxiedObject *)proxy invoke]);
    XCTAssert(targetObject.hasInvoked);
}

- (void)testMethodSignatureForSelector {
    ProxiedObject * targetObject = [[ProxiedObject alloc] init];
    ObjCWeakProxy * proxy = [[ObjCWeakProxy alloc] initWithTarget: targetObject];
    
    XCTAssert([[proxy methodSignatureForSelector: @selector(invoke)] isEqual: [targetObject methodSignatureForSelector: @selector(invoke)]]);
}

- (void)testDescription {
    ObjCWeakProxy * proxy = nil;
    
    @autoreleasepool {
        ProxiedObject * targetObject = [[ProxiedObject alloc] init];
        proxy = [[ObjCWeakProxy alloc] initWithTarget: targetObject];
        
        NSString * description = [NSString stringWithFormat: @"<%@: %p; Target = %@>", NSStringFromClass([proxy class]), proxy, [proxy.target description]];
        XCTAssert([[proxy description] isEqualToString: description], @"%@", [proxy description]);
    }
    
    NSString * description = [NSString stringWithFormat: @"<%@: %p; Target = nil>", NSStringFromClass([proxy class]), proxy];
    XCTAssert([[proxy description] isEqualToString: description], @"%@", [proxy description]);
}

- (void)testDebugDescription {
    ObjCWeakProxy * proxy = nil;
    
    @autoreleasepool {
        ProxiedObject * targetObject = [[ProxiedObject alloc] init];
        proxy = [[ObjCWeakProxy alloc] initWithTarget: targetObject];
        
        NSString * description = [NSString stringWithFormat: @"<%@: %p; Target = %@>", NSStringFromClass([proxy class]), proxy, [proxy.target description]];
        XCTAssert([[proxy debugDescription] isEqualToString: description]);
    }
    
    NSString * description = [NSString stringWithFormat: @"<%@: %p; Target = nil>", NSStringFromClass([proxy class]), proxy];
    XCTAssert([[proxy debugDescription] isEqualToString: description]);
}
@end
