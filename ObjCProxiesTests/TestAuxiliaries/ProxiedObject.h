//
//  ProxiedObject.h
//  ObjCProxies
//
//  Created by WeZZard on 17/10/2018.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProxiedObject : NSObject {
    BOOL _hasInvoked;
}
- (void)invoke;
@property (nonatomic, readonly) BOOL hasInvoked;
@end

NS_ASSUME_NONNULL_END
