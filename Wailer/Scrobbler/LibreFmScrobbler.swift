//
//  LibreFmScrobbler.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 20.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Foundation
import Cocoa
import CommonCrypto
import Alamofire

class LibreFmScrobbler: ScrobblerProtocol {
    static var endpoint: ScrobblerEndpoint = ScrobblerEndpoint.librefm
    
    static var name: String = "Libre.fm"
    
    static var urlAuth: String = "http://libre.fm/api/auth/?api_key=" + Constants.LASTFM_API_KEY + "&token="
    
    static var urlHandshake: String = ""
    
    static var urlSignUp: String = "https://libre.fm/"
    
    static var urlProfile: String = "https://libre.fm/user/"
    
    static var urlWebservice: String = "https://libre.fm/2.0"
    
    static func getMethodUrl(method: String, parameters: [NSURLQueryItem]?) -> URL {
        var queryItems = [NSURLQueryItem(name: "method", value: method),
                          NSURLQueryItem(name: "api_key", value: Constants.LASTFM_API_KEY),
                          ]
        parameters?.forEach({ (queryItem) in
            queryItems.append(queryItem)
        })
        
        let signature = getSignature(queryParams: queryItems)
        queryItems.append(NSURLQueryItem(name: "api_sig", value: signature))
        queryItems.append(NSURLQueryItem(name: "format", value: "json"))
        
        let urlComps = NSURLComponents(string: LibreFmScrobbler.urlWebservice)!
        urlComps.queryItems = queryItems as [URLQueryItem]
        
        return urlComps.url!
    }
    
    func getAuthToken() -> DataRequest {
        return Alamofire.request(LibreFmScrobbler.getMethodUrl(method: "auth.gettoken", parameters: nil))
    }
    
    func getSession(token: String) -> DataRequest {
        return Alamofire.request(LibreFmScrobbler.getMethodUrl(method: "auth.getSession", parameters: [NSURLQueryItem(name: "token", value: token)]))
    }
}
