//
//  LastFmApi.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 16.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa
import Alamofire
import CommonCrypto

class LastFmApi: NSObject {

    static var URL_BASE = "http://ws.audioscrobbler.com/2.0"
    static var URL_GET_AUTH_TOKEN = URL_BASE + "/?method=auth.gettoken&api_key=" + Constants.API_KEY + "&format=json"
    static var URL_USER_PERFORM_AUTH = "http://www.last.fm/api/auth/?api_key=" + Constants.API_KEY + "&token="
    
    static func getMethodUrl(method: String, parameters: [NSURLQueryItem]? = nil) -> URL {
        var queryItems = [NSURLQueryItem(name: "method", value: method),
                          NSURLQueryItem(name: "api_key", value: Constants.API_KEY),
                          ]
        parameters?.forEach({ (queryItem) in
            queryItems.append(queryItem)
        })
        
        let signature = getSignature(queryParams: queryItems)
        queryItems.append(NSURLQueryItem(name: "api_sig", value: signature))
        queryItems.append(NSURLQueryItem(name: "format", value: "json"))

        let urlComps = NSURLComponents(string: URL_BASE)!
        urlComps.queryItems = queryItems as [URLQueryItem]
        
        return urlComps.url!
    }

    public static func getAuthToken() -> DataRequest {
        let URL = getMethodUrl(method: "auth.gettoken");
        
        return Alamofire.request(URL)
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
        signature.append(Constants.API_SECRET)
        return md5(signature)!
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
    
    public static func getSession(token: String) -> DataRequest {
        let URL = getMethodUrl(method: "auth.getSession", parameters: [NSURLQueryItem(name: "token", value: token)])
        print("URL: \(URL)")
        
        return Alamofire.request(URL)
    }
    
    public static func openAuthUrl(token: String) {
        let url = URL_USER_PERFORM_AUTH + token
        NSWorkspace.shared.open(URL.init(string: url)!)
    }
}
