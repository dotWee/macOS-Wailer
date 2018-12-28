//
//  AuthorizeAccountViewController.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 20.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa
import Alamofire

class ConfirmAuthorizationViewController: NSViewController {
    
    var scrobbler: ScrobblerProtocol?
    var choosenScrobbler: ScrobblerEndpoint?
    var scrobblerToken: String?
    
    var alert: NSAlert = NSAlert.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func cancelButtonActionHandler(_ sender: NSButton) {
        print("ConfirmAuthorizationViewController: cancelButtonActionHandler")
        self.dismiss(self)
    }
    
    @IBAction func continueButtonActionHandler(_ sender: NSButton) {
        print("ConfirmAuthorizationViewController: doneButtonActionHandler scrobbler=\(scrobbler!) scrobblerToken=\(scrobblerToken!)")

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
    
    func displayUnexpectedErrorAlert(informaiveText: String) {
        alert.alertStyle = NSAlert.Style.critical
        alert.messageText = "Unexpected Error!"
        alert.informativeText = informaiveText
        
        self.displayAlert()
    }
    
    func displayAlert() {
        alert.beginSheetModal(for: self.view.window!) { (modalResponse) in
            print("ConfirmAuthorizationViewController: modalResponse=\(modalResponse)")
            self.dismiss(self)
        }
    }
}

extension ConfirmAuthorizationViewController: ScrobblerSessionHandshakeProtocol {
    func onSuccess(key: String, name: String, subscriber: Int) {
        print("ConfirmAuthorizationViewController: onSuccess key=\(key) name=\(name) subscriber=\(subscriber) token=\(self.scrobblerToken) scrobbler=\(self.choosenScrobbler)")
        
        let newAccountUid = AccountsDataManager.saveNewAccount(key: key, token: self.scrobblerToken!, username: name, scrobbler: self.choosenScrobbler!)
        if newAccountUid != nil {
            // Show saved account alert
            alert.alertStyle = NSAlert.Style.informational
            alert.messageText = "Successfully authorized as \(name) for \(scrobbler!.name)."
            alert.informativeText = "Wailer will now scrobble to your \(scrobbler!.name) account."
            self.displayAlert()
        } else {
            
            // Show saving error alert
            alert.alertStyle = NSAlert.Style.critical
            alert.messageText = "Error saving account details."
            alert.informativeText = "Received session data looks good, but an error regaring saving appeared."
            self.displayAlert()
        }
    }
    
    func onError(code: Int, message: String) {
        print("ConfirmAuthorizationViewController: onError code=\(code) message=\(message)")
        
        alert.alertStyle = NSAlert.Style.critical
        alert.messageText = "Error \(code) while requesting session."
        alert.informativeText = code == 14 ? "\(message). Please make sure the authorization for \(scrobbler!.name) was successful." : message
        
        // Show error alert
        self.displayAlert()
    }
    
    func onError(result: Result<Any>) {
        print("ConfirmAuthorizationViewController: onError result=\(result)")
        
        alert.alertStyle = NSAlert.Style.critical
        alert.messageText = "Unexpected error appeared."
        alert.informativeText = result.debugDescription
        
        // Show error alert
        self.displayAlert()
    }
}
