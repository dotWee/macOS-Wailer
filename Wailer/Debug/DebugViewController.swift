//
//  DebugWindowController.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 21.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa
import Alamofire

class DebugViewController: NSViewController {
    
    let settingsWindowController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "SettingsWindowController") as! SettingsWindowController
    
    var authToken: String?
    var sessionKey: String?
    
    var lastFmScrobbler: ScrobblerProtocol = LastFmScrobbler.init()
    var libreFmScrobbler: ScrobblerProtocol = LibreFmScrobbler.init()
    
    func printLog(line: String) {
        print(line)
        outputTextView.string.append("\n\(line)")
    }
    
    func clearLog() {
        outputTextView.string = ""
    }
    
    @IBOutlet var outputTextView: NSTextView!

    @IBAction func buttonLastFmGetAuthToken(_ sender: NSButton) {
        lastFmScrobbler.performTokenRequest(handshakeProtocol: self)
    }
    
    @IBAction func buttonLastFmOpenAuthUrl(_ sender: NSButton) {
        LastFmScrobbler.openAuthUrl(token: self.authToken!)
    }
    
    @IBAction func buttonLastFmGetSession(_ sender: NSButton) {
        lastFmScrobbler.performSessionRequest(handshakeProtocol: self, token: self.authToken!)
    }
    
    @IBAction func buttonLibreFmGetAuthToken(_ sender: NSButton) {
        libreFmScrobbler.performTokenRequest(handshakeProtocol: self)
    }
    
    @IBAction func buttonLibreFmOpenAuthUrl(_ sender: NSButton) {
        LibreFmScrobbler.openAuthUrl(token: self.authToken!)
    }
    
    @IBAction func buttonLibreFmGetSession(_ sender: NSButton) {
        libreFmScrobbler.performSessionRequest(handshakeProtocol: self, token: self.authToken!)
    }
    
    @IBAction func buttonCoreDataClear(_ sender: NSButton) {
    }
    
    @IBAction func buttonCoreDataCreate(_ sender: NSButton) {
    }
    
    @IBAction func buttonCoreDataDump(_ sender: NSButton) {
    }
    
    @IBAction func buttonWindowsSettings(_ sender: NSButton) {
    }
}

extension DebugViewController: ScrobblerTokenHandshakeProtocol, ScrobblerSessionHandshakeProtocol {
    func onSuccess(key: String, name: String, subscriber: Int) {
        self.printLog(line: "onSuccess: key=\(key) name=\(name) subscriber=\(subscriber)")
        self.sessionKey = key
    }
    
    func onSuccess(token: String) {
        self.printLog(line: "onSuccess: token=\(token)")
        self.authToken = token
    }
    
    func onError(code: Int, message: String) {
        self.printLog(line: "onError: code=\(code) message=\(message)")
    }
    
    func onError(result: Result<Any>) {
        self.printLog(line: "onError: result=\(result)")
    }
}
