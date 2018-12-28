//
//  PlayerPreferencesViewController.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 26.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa

class PlayerPreferencesViewController: NSViewController {
    private let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PlayerPreferencesViewController: viewDidLoad")
        
        // Do view setup here.
        buttonSpotifyScrobbleRestoreHandler()
        buttonItunesScrobbleRestoreHandler()
    }
    
    /*
     UserDefault for KEY keyScrobbleSpotify
     */
    public static let keyScrobbleSpotify = "ScrobbleSpotify"
    
    @IBOutlet weak var buttonSpotifyScrobble: NSButton!
    
    func buttonSpotifyScrobbleRestoreHandler() {
        let defaultValue = self.defaults.integer(forKey: PlayerPreferencesViewController.keyScrobbleSpotify)
        self.buttonSpotifyScrobble.state = NSControl.StateValue.init(defaultValue)
    }
    
    @IBAction func buttonSpotifyScrobbleActionHandler(_ sender: NSButton) {
        print("PlayerSettingsViewController: CALL buttonSpotifyScrobbleActionHandler state=\(buttonSpotifyScrobble.state)")
        self.defaults.set(buttonSpotifyScrobble.state.rawValue, forKey: PlayerPreferencesViewController.keyScrobbleSpotify)
    }
    
    /*
     UserDefault for KEY keyScrobbleItunes
     */
    public static let keyScrobbleItunes = "ScrobbleItunes"
    
    @IBOutlet weak var buttonItunesScrobble: NSButton!
    
    func buttonItunesScrobbleRestoreHandler() {
        let defaultValue = self.defaults.integer(forKey: PlayerPreferencesViewController.keyScrobbleItunes)
        self.buttonItunesScrobble.state = NSControl.StateValue.init(defaultValue)
    }
    
    @IBAction func buttonItunesScrobbleActionHandler(_ sender: NSButton) {
        print("PlayerSettingsViewController: CALL buttonItunesScrobbleActionHandler state=\(buttonItunesScrobble.state)")
        self.defaults.set(buttonItunesScrobble.state.rawValue, forKey: PlayerPreferencesViewController.keyScrobbleItunes)
    }
    
}
