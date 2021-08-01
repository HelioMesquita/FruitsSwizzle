//
//  Orange+MonitorWrites.swift
//  FruitsSwizzle
//
//  Created by Hélio Mesquita on 01/08/21.
//

import Foundation
import Fruits

public extension Orange {
    
    func swizzle() {
        let aClass: AnyClass! = object_getClass(self)

        let defaultSelector = #selector(detail);
        let swizzledSelector = #selector(swizzled_detail);
        
        let defaultMethod = class_getInstanceMethod(aClass, defaultSelector);
        let swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
        
        let isMethodExists = !class_addMethod(aClass, defaultSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!));
        
        if (isMethodExists) {
            method_exchangeImplementations(defaultMethod!, swizzledMethod!);
        }
        else {
            class_replaceMethod(aClass, swizzledSelector, method_getImplementation(defaultMethod!), method_getTypeEncoding(defaultMethod!));
        }
    }
    
    @objc func swizzled_detail() -> String {
        return "\(fruitName) was swizzled 😁 on swizzle method in external framework"
    }
    
    
    
}
