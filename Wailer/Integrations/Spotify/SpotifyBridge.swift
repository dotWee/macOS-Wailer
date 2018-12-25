//
//  SpotifyBridge.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 22.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa
import ScriptingBridge

class SpotifyBridge: NSObject, SBApplicationDelegate {
    
    func eventDidFail(_ event: UnsafePointer<AppleEvent>, withError error: Error) -> Any? {
        print("SpotifyBridge: eventDidFail error=\(error)")
        return event
    }
    
    public let app: SpotifyApplication
    
    override required init() {
        self.app = ScriptingUtilities.application(bundleIdentifier: "com.spotify.client") as! SpotifyApplication
        super.init()
        
        self.app.delegate = self
        print("SpotifyBridge: \(self.app.delegate.debugDescription)")
    }
    
    public func play() {
        self.app.play!()
    }
    
    public func pause() {
        self.app.pause!()
    }
    
    public func getCurrentStatus() -> SpotifyEPlS? {
        return self.app.playerState
    }
    
    public func getCurrentTrack() -> SpotifyTrack? {
        return self.app.currentTrack
    }
}
