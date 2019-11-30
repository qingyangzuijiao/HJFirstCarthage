//
//  HJMethodTool.swift
//  HJFirstCarthageSDK
//
//  Created by whj on 2019/12/1.
//  Copyright © 2019 whj. All rights reserved.
//

import Foundation


public class HJMethodTool: NSObject {
    
    public override init() {}
    
    public class func printMethodListWithObj(obj: AnyObject) {
        var count: UInt32 = 0
        let methodList = class_copyMethodList(obj.classForCoder, &count)
        
        for i in 0..<Int(count) {
            
            guard let method = methodList?[i] else { return }
            // 方法实现
            let _ = method_getImplementation(method)
            // SEL
            let selector = method_getName(method)
            // 方法名
            let sName = sel_getName(selector)
            // 参数个数
            let argCount = method_getNumberOfArguments(method)
            // 编码方式
            let sEncoding = method_getTypeEncoding(method)
            
            guard let sel_name = String(utf8String: sName),
                let char_encoding = sEncoding,
                let encoding = String(utf8String: char_encoding) else {
                    return
            }
            print("方法名:\(sel_name)----参数个数:\(argCount)----编码方式:\(encoding)")
        }
    }
    
}
