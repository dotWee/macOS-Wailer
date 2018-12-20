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

class LastFmScrobbler: ScrobblerProtocol {
    static var endpoint: ScrobblerEndpoint = ScrobblerEndpoint.lastfm
    
    var name: String = "Last.fm"
    static var urlHandshake: String = "http://post.audioscrobbler.com/?hs=true"
    static var urlSignUp: String = "https://www.last.fm/join"
    static var urlProfile: String = "https://www.last.fm/user/"
    static var urlWebservice: String = "https://ws.audioscrobbler.com/2.0"
    
    static var urlAuth: String = "http://www.last.fm/api/auth/?api_key=" + Constants.LASTFM_API_KEY + "&token="
    
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
        
        let urlComps = NSURLComponents(string: LastFmScrobbler.urlWebservice)!
        urlComps.queryItems = queryItems as [URLQueryItem]
        
        return urlComps.url!
    }
    
    func getAuthToken() -> DataRequest {
        let URL = LastFmScrobbler.getMethodUrl(method: "auth.gettoken", parameters: nil);
        
        return Alamofire.request(URL)
    }
    
    func getSession(token: String) -> DataRequest {
        let URL = LastFmScrobbler.getMethodUrl(method: "auth.getSession", parameters: [NSURLQueryItem(name: "token", value: token)])
        print("URL: \(URL)")
        
        return Alamofire.request(URL)
    }
}
