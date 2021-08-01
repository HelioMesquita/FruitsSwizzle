//
//  Banana+Swizzle.h
//  FruitsSwizzle
//
//  Created by Hélio Mesquita on 01/08/21.
//

#import "Banana+Swizzle.h"
#import <objc/runtime.h>

@implementation Banana (Swizzle)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL defaultSelector = @selector(detail);
        SEL swizzledSelector = @selector(swizzled_detail);
        
        Method defaultMethod = class_getInstanceMethod(class, defaultSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL isMethodExists = !class_addMethod(class, defaultSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (isMethodExists) {
            method_exchangeImplementations(defaultMethod, swizzledMethod);
        }
        else {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(defaultMethod), method_getTypeEncoding(defaultMethod));
        }
    });
}

#pragma mark - Method Swizzling
- (NSString *)swizzled_detail {
    return [NSString stringWithFormat:@"%@ was swizzled 😁 on load in external framework", NSStringFromClass([self class])];
}

@end
