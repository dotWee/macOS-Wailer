//
//  SpotifyBridge.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 22.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa

class SpotifyBridge: NSObject {
    public let app = ScriptingUtilities.application(bundleIdentifier: "com.spotify.client") as! SpotifyApplication
    
    public func getCurrentTrack() -> SpotifyTrack? {
        return app.currentTrack
    }
    
    public func printCurrentTrack() {
        let currentTrack = app.currentTrack!
        
        let artist = currentTrack.artist!
        let name = currentTrack.name!
        
        print("SpotifyBridge: printCurrentTrack artist=\(artist) name=\(name)")
    }
}
