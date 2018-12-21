//
//  iTunesScripting.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 22.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa
import Foundation
import ScriptingBridge

public enum iTunesScripting: String {
    case airplayDevice = "AirPlay device"
    case eqPreset = "EQ preset"
    case eqWindow = "EQ window"
    case urlTrack = "URL track"
    case application = "application"
    case artwork = "artwork"
    case audioCdPlaylist = "audio CD playlist"
    case audioCdTrack = "audio CD track"
    case browserWindow = "browser window"
    case encoder = "encoder"
    case fileTrack = "file track"
    case folderPlaylist = "folder playlist"
    case item = "item"
    case libraryPlaylist = "library playlist"
    case miniplayerWindow = "miniplayer window"
    case playlistWindow = "playlist window"
    case playlist = "playlist"
    case radioTunerPlaylist = "radio tuner playlist"
    case sharedTrack = "shared track"
    case source = "source"
    case subscriptionPlaylist = "subscription playlist"
    case track = "track"
    case userPlaylist = "user playlist"
    case videoWindow = "video window"
    case visual = "visual"
    case window = "window"
}