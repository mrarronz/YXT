//
//  StringExtension.swift
//  yxt
//
//  Created by Arron Zhu on 2017/9/27.
//  Copyright © 2017年 sundataonline. All rights reserved.
//

import Foundation

extension String {
    
    func md5String() -> String{
        let cStr = self.cString(using: String.Encoding.utf8)
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< digestLen {
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
}
