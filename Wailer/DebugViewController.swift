//
//  ViewController.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 16.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa
import Alamofire

class DebugViewController: NSViewController, ScrobblerTokenHandshakeProtocol, ScrobblerSessionHandshakeProtocol {
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
    
    @IBAction func buttonTestCoreDataActionHandler(_ sender: NSButton) {
        
        let result = AccountsDataManager.getAllAccountsSorted()
        
        self.printLog(line: "buttonTestCoreDataActionHandler: result=\(result)")
        /*
        for data in result! {
            printLog(line: data.value(forKey: "accountId") as! String)
        }
        */
    }
    
    let settingsWindowController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "SettingsWindowController") as! SettingsWindowController
    
    var authToken: String?
    var sessionKey: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBOutlet var outputTextView: NSTextView!
    
    @IBAction func openSettingsWindowActionHandler(_ sender: NSButton) {
        settingsWindowController.showWindow(self)
    }
    
    func printLog(line: String) {
        print(line)
        outputTextView.string.append("\n\(line)")
    }
    
    func clearLog() {
        outputTextView.string = ""
    }
    
    @IBAction func lastFmGetAuthTokenActionHandler(_ sender: NSButton) {
        self.clearLog()
        
        LastFmScrobbler.init().performTokenRequest(handshakeProtocol: self)

    }
    
    @IBAction func lastFmOpenAuthUrlActionHandler(_ sender: NSButton) {
        LastFmScrobbler.openAuthUrl(token: self.authToken!)
    }
    
    @IBAction func lastFmGetSessionActionHandler(_ sender: NSButton) {
        LastFmScrobbler.init().performSessionRequest(handshakeProtocol: self, token: self.authToken!)
    }
    @IBAction func libreFmGetAuthTokenActionHandler(_ sender: NSButton) {
        LibreFmScrobbler.init().performTokenRequest(handshakeProtocol: self)
        
        /*
        LibreFmApi.getAuthToken().responseJSON { response in
            self.printLog(line: "Request: \(String(describing: response.request))")   // original url request
            self.printLog(line: "Response: \(String(describing: response.response))") // http url response
            self.printLog(line: "Result: \(response.result)")                         // response serialization result
            
            let json = response.result.value as! [String: AnyObject?]
            
            if let token = json["token"] as! String? {
                self.printLog(line: "Token: \(token)")
                self.libreFmAuthToken = token
            } else if let error = json["error"] as! Int? {
                let message = json["message"] as! String
                self.printLog(line: "Error \(error): \(message)")
            } else {
                // Nope
            }
        }
        */
    }
    
    @IBAction func libreFmOpenAuthUrlActionHandler(_ sender: NSButton) {
        LibreFmScrobbler.openAuthUrl(token: self.authToken!)
    }
    
    @IBAction func libreFmGetSessionActionHandler(_ sender: NSButton) {
        self.clearLog()
        
        LibreFmScrobbler.init().performSessionRequest(handshakeProtocol: self, token: self.authToken!)
        
        /*
        LibreFmApi.getSession(token: self.libreFmAuthToken!).responseJSON { response in
            self.printLog(line: "Request: \(String(describing: response.request))")   // original url request
            self.printLog(line: "Response: \(String(describing: response.response))") // http url response
            self.printLog(line: "Result: \(response.result)")                         // response serialization result
            
            let json = response.result.value as! [String: AnyObject?]
            self.printLog(line: "JSON: \(json)")
            
            if let session = json["session"] as AnyObject? {
                let sessionKey = session["key"] as! String
                self.libreFmSessionKey = sessionKey
                self.printLog(line: "Session Key: \(sessionKey)")
                
                let sessionName = session["name"] as! String
                self.printLog(line: "Session Name: \(sessionName)")
                
                let sessionSubscriber = session["subscriber"] as! Int
                self.printLog(line: "Session Subscriber: \(sessionSubscriber)")
            } else if let error = json["error"] as! Int? {
                let message = json["message"] as! String
                self.printLog(line: "Error \(error): \(message)")
            } else {
                // Nope
            }
        }
        */
    }
    
}

