//
//  iTunesBridge.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 22.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa

class iTunesBridge: NSObject {
    public let app = ScriptingUtilities.application(bundleIdentifier: "com.apple.iTunes") as! iTunesApplication
    
    public func getCurrentTrack() -> iTunesTrack? {
        return app.currentTrack
    }
    
    public func printCurrentTrack() {
        let currentTrack = app.currentTrack!
        print("iTunesBridge: printCurrentTrack currentTrack=\(currentTrack)")
    }
}
