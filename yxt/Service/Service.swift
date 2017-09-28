//
//  Service.swift
//  yxt
//
//  Created by Arron Zhu on 2017/9/27.
//  Copyright © 2017年 sundataonline. All rights reserved.
//

import Foundation
import SwiftyJSON

class Service: BaseRequest {
    
    /// 手机号登录
    public class func login(phone: String, pwd: String, completion: responseBlock?) {
        let params = ["phone": phone, "password": pwd]
        let dict = encryptedParams(params, needToken: false)
        super.sendRequest(url: "api/login", params: dict, completion: completion)
    }
    
    /// 课内网登录
    public class func login(username: String, pwd: String, completion: responseBlock?) {
        let params = ["username": username, "password": pwd]
        let dict = encryptedParams(params, needToken: false)
        super.sendRequest(url: "api/iknLogin", params: dict, completion: completion)
    }
    
    /// 微信授权登录
    public class func login(openId: String, accessToken: String, completion: responseBlock?) {
        let params = ["openId": openId, "access_token": accessToken]
        let dict = encryptedParams(params, needToken: false)
        sendRequest(url: "api/wxChat", params: dict, completion: completion)
    }
    
    /// 注册
    public class func register(phone: String, pwd: String, smsCode: String, completion: responseBlock?) {
        let params = ["phone": phone, "password": pwd, "code": smsCode]
        let dict = encryptedParams(params, needToken: false)
        sendRequest(url: "api/register", params: dict, completion: completion)
    }
    
    /// 发送验证码
    public class func getSMSCode(phone: String, type: String, completion: responseBlock?) {
        let params = ["phone": phone, "type": type]
        let dict = encryptedParams(params, needToken: false)
        sendRequest(url: "api/sendCode", params: dict, completion: completion)
    }
    
    /// 找回密码
    public class func findPassword(phone: String, code: String, pwd: String, repeatPwd: String, completion: responseBlock?) {
        let params = ["phone": phone, "code": code, "password": pwd, "repassword": repeatPwd]
        let dict = encryptedParams(params, needToken: false)
        sendRequest(url: "api/findPwd", params: dict, completion: completion)
    }
    
    /// 绑定手机号
    public class func bindPhone(phone: String, code: String, completion: responseBlock?) {
        let params = ["phone": phone, "code": code]
        let dict = encryptedParams(params, needToken: true)
        sendRequest(url: "api/bindPhone", params: dict, completion: completion)
    }
    
    /// 修改昵称
    public class func updateNickname(_ nickName: String, completion: responseBlock?) {
        let params = ["nickname": nickName]
        let dict = encryptedParams(params, needToken: true)
        sendRequest(url: "api/saveNickname", params: dict, completion: completion)
    }
    
    /// 修改头像
    public class func updateAvatar(_ avatar: String, completion: responseBlock?) {
        let params = ["img": avatar]
        let dict = encryptedParams(params, needToken: true)
        sendRequest(url: "api/upAvatar", params: dict, completion: completion)
    }
    
    /// 扫码, 获取单个易学贴课程数据
    public class func scanCode(qrcode: String?, activate: String?, study: String?, completion: responseBlock?) {
        var params = Dictionary<String, String>.init()
        if qrcode != nil {
            params["id"] = qrcode!
        }
        if activate != nil {
            params["a"] = activate!
        }
        if study != nil {
            params["s"] = study!
        }
        let dict = encryptedParams(params, needToken: true)
        sendRequest(url: "api/getQRcode", params: dict, completion: completion)
    }
    
    /// 我的课程
    public class func getCourse(page: Int, completion: responseBlock?) {
        let params = ["page": String.init(format: "%d", page)]
        let dict = encryptedParams(params, needToken: true)
        sendRequest(url: "api/myCourse", params: dict, completion: completion)
    }
    
    /// 易学贴课程详情
    public class func yxtDetail(_ bookId: String, completion: responseBlock?) {
        let params = ["id" : bookId]
        let dict = encryptedParams(params, needToken: true)
        sendRequest(url: "api/easyLearnDetail", params: dict, completion: completion)
    }
}
