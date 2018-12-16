//
//  ViewController.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 16.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa

class DebugViewController: NSViewController {
    
    let settingsWindowController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "SettingsWindowController") as! SettingsWindowController
    
    var lastFmAuthToken: String?
    var lastFmSessionKey: String?

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
        
        LastFmApi.getAuthToken().responseJSON { response in
            self.printLog(line: "Request: \(String(describing: response.request))")   // original url request
            self.printLog(line: "Response: \(String(describing: response.response))") // http url response
            self.printLog(line: "Result: \(response.result)")                         // response serialization result
            
            let json = response.result.value as! [String: AnyObject?]
            
            if let token = json["token"] as! String? {
                self.printLog(line: "Token: \(token)")
                self.lastFmAuthToken = token
            } else if let error = json["error"] as! Int? {
                let message = json["message"] as! String
                self.printLog(line: "Error \(error): \(message)")
            } else {
                // Nope
            }
        }
    }
    
    @IBAction func lastFmOpenAuthUrlActionHandler(_ sender: NSButton) {
        LastFmApi.openAuthUrl(token: self.lastFmAuthToken!)
    }
    
    @IBAction func lastFmGetSessionActionHandler(_ sender: NSButton) {
        self.clearLog()
        
        LastFmApi.getSession(token: self.lastFmAuthToken!).responseJSON { response in
            self.printLog(line: "Request: \(String(describing: response.request))")   // original url request
            self.printLog(line: "Response: \(String(describing: response.response))") // http url response
            self.printLog(line: "Result: \(response.result)")                         // response serialization result
            
            let json = response.result.value as! [String: AnyObject?]
            self.printLog(line: "JSON: \(json)")
            
            if let session = json["session"] as AnyObject? {
                let sessionKey = session["key"] as! String
                self.lastFmSessionKey = sessionKey
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
    }
}

