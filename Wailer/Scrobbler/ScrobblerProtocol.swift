//
//  ScrobblerProtocol.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 18.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa
import Alamofire
import CommonCrypto

protocol ScrobblerProtocol {
    var name: String { get }
    static var endpoint: ScrobblerEndpoint { get }
    
    static var urlAuth: String { get }
    static var urlHandshake: String { get }
    static var urlSignUp: String { get }
    static var urlProfile: String { get }
    static var urlWebservice: String { get }
    
    static func getMethodUrl(method: String, parameters: [NSURLQueryItem]?) -> URL
    func getAuthToken() -> DataRequest
    static func getSignature(queryParams: [NSURLQueryItem]) -> String!
    static func md5(_ string: String) -> String?
    func getSession(token: String) -> DataRequest
    static func openAuthUrl(token: String)
}

protocol ScrobblerTokenHandshakeProtocol {
    func onSuccess(token: String)

    func onError(code: Int, message: String)
    func onError(result: Result<Any>)
}

extension ScrobblerProtocol {
    static func openAuthUrl(token: String) {
        let url = self.urlAuth + token
        NSWorkspace.shared.open(URL.init(string: url)!)
    }
    
    static func md5(_ string: String) -> String? {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        var digest = [UInt8](repeating: 0, count: length)
        
        if let d = string.data(using: String.Encoding.utf8) {
            _ = d.withUnsafeBytes { (body: UnsafePointer<UInt8>) in
                CC_MD5(body, CC_LONG(d.count), &digest)
            }
        }
        
        return (0..<length).reduce("") {
            $0 + String(format: "%02x", digest[$1])
        }
    }
    
    static func getSignature(queryParams: [NSURLQueryItem]) -> String! {
        var paramsDict: [String: String] = [:]
        queryParams.forEach { (queryParam) in
            paramsDict[queryParam.name] = queryParam.value!
        }
        
        var signature = ""
        paramsDict.keys.sorted().forEach { (key) in
            let value = paramsDict[key]
            signature.append(key)
            signature.append(value!)
        }
        
        print("Signature: \(signature)")
        signature.append(Constants.LASTFM_API_SECRET)
        return md5(signature)!
    }
    
    func performTokenRequest(handshakeProtocol: ScrobblerTokenHandshakeProtocol) {
        
        self.getAuthToken().responseJSON { response in
            let json = response.result.value as! [String: AnyObject?]
            if let token = json["token"] as! String? {
                handshakeProtocol.onSuccess(token: token)
                
            } else if let code = json["error"] as! Int? {
                let message = json["message"] as! String
                handshakeProtocol.onError(code: code, message: message)
                
            } else {
                handshakeProtocol.onError(result: response.result)
            }
        }
    }
    
    func performSessionRequest(handshakeProtocol: ScrobblerSessionHandshakeProtocol, token: String) {
        
        self.getSession(token: token).responseJSON { response in
            let json = response.result.value as! [String: AnyObject?]
            print("json=\(json)")
            
            if let session = json["session"] as AnyObject? {
                let sessionKey = session["key"] as! String
                let sessionName = session["name"] as! String
                let sessionSubscriber = session["subscriber"] as! Int
                
                handshakeProtocol.onSuccess(key: sessionKey, name: sessionName, subscriber: sessionSubscriber)
                
            } else if let code = json["error"] as! Int? {
                let message = json["message"] as! String
                handshakeProtocol.onError(code: code, message: message)
                
            } else {
                handshakeProtocol.onError(result: response.result)
                
            }
            
            return
        }
    }
}

protocol ScrobblerSessionHandshakeProtocol {
    func onSuccess(key: String, name: String, subscriber: Int);
    func onError(code: Int, message: String)
    func onError(result: Result<Any>)
}
