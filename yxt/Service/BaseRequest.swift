//
//  HttpServiceWrapper.swift
//  yxt
//
//  Created by Arron Zhu on 16/11/25.
//  Copyright © 2016年 sundataonline. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

fileprivate let baseURL = "http://www.xuetang365.com/"
fileprivate let appKey = "wt3734wy636dhd3636sr8888t6"
fileprivate let appSecret = "7717aab6e826788ded5d805a53596ffb"

public typealias successBlock = ((_ response: JSON) -> Void)
public typealias failureBlock = ((_ error: Error) -> Void)

class BaseRequest: NSObject {

    /// 发送请求的方法
    public class func sendRequest(url: String!,
                                  params: [String: String]?,
                                  success: successBlock?,
                                  failure: failureBlock?) {
        let requestURL = URL.init(string: baseURL + url)!
        Alamofire.request(requestURL, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let data = JSON(value)
                success?(data)
            case .failure(let error):
                failure?(error)
            }
        }
    }
    
    /// 获取登录之后的存储在本地的token
    public class func token() -> String {
        let token = UserDefaults.standard.string(forKey: "token")
        if token == nil {
            return ""
        }
        return token!
    }
    
    /// 将接口参数加密得到包含有sign参数的请求数据，如果接口需要传入token，将token也加入进来
    public class func encryptedParams(_ dict: [String : String], needToken: Bool) -> [String : String] {
        var params = dict
        params["appId"] = appKey
        params["messageFormat"] = "json"
        params["v"] = "1.0"
        if needToken {
            params["token"] = token()
        }
        params["sign"] = encryptedString(params)
        return params
    }
    
    /// 对接口参数进行排序加密
    public class func encryptedString(_ dict: [String : String]) -> String {
        let sortedKeys: [String] = dict.keys.sorted()
        var signedStr = appSecret
        for key in sortedKeys {
            signedStr = signedStr + key + dict[key]!
        }
        let finalStr = signedStr.md5String()
        return finalStr.uppercased()
    }
}
