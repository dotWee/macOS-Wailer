//
//  SpotifyBridge.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 22.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa
import Foundation
import ScriptingBridge

class SpotifyBridge: NSObject, SBApplicationDelegate, SBBridgeProtocol {
    
    public let app: SpotifyApplication
    
    override required init() {
        self.app = ScriptingUtilities.application(bundleIdentifier: "com.spotify.client") as! SpotifyApplication
        
        super.init()
        self.app.delegate = self
        
        // Observe Spotify player state changes
        // self.addPlaybackChangeListener()
    }
    
    @objc public func onPlaybackChange() {
        let currentTrack = self.app.currentTrack
        let currentState = self.app.playerState
        
        print("SpotifyBridge: CALL onPlaybackChange currentState=\(currentState) currentTrack\(currentTrack)")
    }
    
    func eventDidFail(_ event: UnsafePointer<AppleEvent>, withError error: Error) -> Any? {
        print("SpotifyBridge: CALL eventDidFail error=\(error)")
        return event
    }
    
    func getApplication() -> SBApplicationProtocol {
        return self.app
    }
    
    func getCurrentTrack() -> SBObjectProtocol? {
        return self.app.currentTrack
    }
    
    func isPlaying() -> Bool {
        return self.app.playerState == SpotifyEPlS.playing
    }
    
    func addPlaybackChangeListener() {
        DistributedNotificationCenter.default().addObserver(self, selector: #selector(onPlaybackChange), name: NSNotification.Name(rawValue: "com.spotify.client.PlaybackStateChanged"), object: nil)
    }
}
