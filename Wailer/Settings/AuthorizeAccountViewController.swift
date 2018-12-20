//
//  AuthorizeAccountViewController.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 20.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa
import Alamofire

class AuthorizeAccountViewController: NSViewController {
    
    var scrobbler: ScrobblerProtocol?
    var choosenScrobbler: ScrobblerEndpoint?
    var scrobblerToken: String?
    
    var alert: NSAlert = NSAlert.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func cancelButtonActionHandler(_ sender: NSButton) {
        print("AuthorizeAccountViewController: cancelButtonActionHandler")
        self.dismiss(self)
    }
    
    @IBAction func doneButtonActionHandler(_ sender: NSButton) {
        print("AuthorizeAccountViewController: doneButtonActionHandler scrobbler=\(scrobbler!) scrobblerToken=\(scrobblerToken!)")

        // Perform ScrobblerProtocol->getSession() and wait for result
        if scrobbler != nil && scrobblerToken != nil {
            scrobbler!.performSessionRequest(handshakeProtocol: self, token: scrobblerToken!)
        } else {
            // Scrobbler or token are invalid
            
            alert.alertStyle = NSAlert.Style.critical
            alert.messageText = "Unexpected error appeared."
            alert.informativeText = "Invalid scrobbler protocol instance or token. Please check application logs."
            
            // Show error alert
            self.displayAlert()
        }
    }
    
    func displayAlert() {
        alert.beginSheetModal(for: self.view.window!) { (modalResponse) in
            print("AuthorizeAccountViewController: modalResponse=\(modalResponse)")
            self.dismiss(self)
        }
    }
}

extension AuthorizeAccountViewController: ScrobblerSessionHandshakeProtocol {
    func onSuccess(key: String, name: String, subscriber: Int) {
        print("AuthorizeAccountViewController: onSuccess key=\(key) name=\(name) subscriber=\(subscriber)")
        
        // TODO Safe details
        
        alert.alertStyle = NSAlert.Style.informational
        alert.messageText = "Successfully authorized as \(name) for \(scrobbler!.name)"
        alert.informativeText = "Wailer will now scrobble to your \(scrobbler!.name) account."
        
        // Show success alert
        self.displayAlert()
    }
    
    func onError(code: Int, message: String) {
        print("AuthorizeAccountViewController: onError code=\(code) message=\(message)")
        
        alert.alertStyle = NSAlert.Style.critical
        alert.messageText = "Error \(code) while requesting session."
        alert.informativeText = code == 14 ? "\(message). Please make sure the authorization for \(scrobbler!.name) was successful." : message
        
        // Show error alert
        self.displayAlert()
    }
    
    func onError(result: Result<Any>) {
        print("AuthorizeAccountViewController: onError result=\(result)")
        
        alert.alertStyle = NSAlert.Style.critical
        alert.messageText = "Unexpected error appeared."
        alert.informativeText = result.debugDescription
        
        // Show error alert
        self.displayAlert()
    }
}
