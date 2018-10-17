//
//  ObjCStrongProxyTests.m
//  ObjCProxies
//
//  Created by WeZZard on 17/10/2018.
//

#import <XCTest/XCTest.h>

#import <ObjCProxies/ObjCStrongProxy.h>

#import "ProxiedObject.h"

@interface ObjCStrongProxyTests : XCTestCase

@end

@implementation ObjCStrongProxyTests
- (void)testTarget_holds_a_strong_reference {
    ObjCStrongProxy * proxy = nil;
    NSObject * strongReference = nil;
    @autoreleasepool {
        strongReference = [[NSObject alloc] init];
        proxy = [[ObjCStrongProxy alloc] initWithTarget: strongReference];
        XCTAssert(proxy.target == strongReference);
    }
    XCTAssert(proxy != nil);
    XCTAssert(strongReference != nil);
    XCTAssert(proxy.target == strongReference);
}

- (void)testForwardInvocation {
    ProxiedObject * targetObject = [[ProxiedObject alloc] init];
    ObjCStrongProxy * proxy = [[ObjCStrongProxy alloc] initWithTarget: targetObject];
    
    XCTAssert(!targetObject.hasInvoked);
    XCTAssertNoThrow([(ProxiedObject *)proxy invoke]);
    XCTAssert(targetObject.hasInvoked);
}

- (void)testMethodSignatureForSelector {
    ProxiedObject * targetObject = [[ProxiedObject alloc] init];
    ObjCStrongProxy * proxy = [[ObjCStrongProxy alloc] initWithTarget: targetObject];
    
    XCTAssert([[proxy methodSignatureForSelector: @selector(invoke)] isEqual: [targetObject methodSignatureForSelector: @selector(invoke)]]);
}

- (void)testDescription {
    ObjCStrongProxy * proxy = nil;
    
    @autoreleasepool {
        ProxiedObject * targetObject = [[ProxiedObject alloc] init];
        proxy = [[ObjCStrongProxy alloc] initWithTarget: targetObject];
        
        NSString * description = [NSString stringWithFormat: @"<%@: %p; Target = %@>", NSStringFromClass([proxy class]), proxy, [proxy.target description]];
        XCTAssert([[proxy description] isEqualToString: description], @"%@", [proxy description]);
    }
    
    NSString * description = [NSString stringWithFormat: @"<%@: %p; Target = %@>", NSStringFromClass([proxy class]), proxy, [proxy.target description]];
    XCTAssert([[proxy description] isEqualToString: description], @"%@", [proxy description]);
}

- (void)testDebugDescription {
    ObjCStrongProxy * proxy = nil;
    
    @autoreleasepool {
        ProxiedObject * targetObject = [[ProxiedObject alloc] init];
        proxy = [[ObjCStrongProxy alloc] initWithTarget: targetObject];
        
        NSString * description = [NSString stringWithFormat: @"<%@: %p; Target = %@>", NSStringFromClass([proxy class]), proxy, [proxy.target description]];
        XCTAssert([[proxy debugDescription] isEqualToString: description]);
    }
    
    NSString * description = [NSString stringWithFormat: @"<%@: %p; Target = %@>", NSStringFromClass([proxy class]), proxy, [proxy.target description]];
    XCTAssert([[proxy description] isEqualToString: description], @"%@", [proxy description]);
}
@end
