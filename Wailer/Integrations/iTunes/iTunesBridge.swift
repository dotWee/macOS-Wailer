//
//  iTunesBridge.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 22.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa
import Foundation
import ScriptingBridge

class iTunesBridge: NSObject, SBApplicationDelegate, SBBridgeProtocol {
    
    public let app: iTunesApplication
    
    override required init() {
        self.app = ScriptingUtilities.application(bundleIdentifier: "com.apple.iTunes") as! iTunesApplication
        
        super.init()
        self.app.delegate = self
        
        // Observe iTunes player state changes
        self.addPlaybackChangeListener()
    }
    
    @objc public func onPlaybackChange() {
        let currentTrack = self.app.currentTrack
        let currentState = self.app.playerState
        
        print("iTunesBridge: CALL onPlaybackChange currentState=\(currentState) currentTrack\(currentTrack)")
    }
    
    func getApplication() -> SBApplicationProtocol {
        return self.app
    }
    
    func getCurrentTrack() -> SBObjectProtocol? {
        return self.app.currentTrack
    }
    
    func isPlaying() -> Bool {
        return self.app.playerState == iTunesEPlS.playing
    }
    
    func addPlaybackChangeListener() {
        DistributedNotificationCenter.default().addObserver(self, selector: #selector(onPlaybackChange), name: NSNotification.Name(rawValue: "com.apple.iTunes.playerInfo"), object: nil)
    }
    
    func eventDidFail(_ event: UnsafePointer<AppleEvent>, withError error: Error) -> Any? {
        print("iTunesBridge: CALL eventDidFail error=\(error)")
        return event
    }
}
