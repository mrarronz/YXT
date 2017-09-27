//
//  Service.swift
//  yxt
//
//  Created by Arron Zhu on 2017/9/27.
//  Copyright © 2017年 sundataonline. All rights reserved.
//

import Foundation
import SwiftyJSON

public typealias responseBlock = ((_ succeed: Bool, _ response: Any?, _ msg: String?) -> Void)

class Service: BaseRequest {
    
    public class func login(phone: String, pwd: String, completion: responseBlock?) {
        let params = ["phone": phone, "password": pwd]
        let dict = encryptedParams(params, needToken: false)
        super.sendRequest(url: "api/login", params: dict, success: { (response) in
            print("the request result: \(response)")
            let status = Int(response["status"].string!)
            let msg = response["msg"].string
            let data = response["data"].object
            if status == 200 {
                completion?(true, data, msg)
            } else {
                completion?(false, data, msg)
            }
        }) { (error) in
            print("error: \(error)")
            completion?(false, nil, error.localizedDescription)
        }
    }
}
