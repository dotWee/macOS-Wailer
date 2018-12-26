//
//  SBBridgeProtocol.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 25.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa

protocol SBBridgeProtocol {
    
    func getApplication() -> SBApplicationProtocol
    func getCurrentTrack() -> SBObjectProtocol?
    func isPlaying() -> Bool

    func addPlaybackChangeListener()
    func onPlaybackChange()
}
