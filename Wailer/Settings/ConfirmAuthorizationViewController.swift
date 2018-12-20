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
        print("ConfirmAuthorizationViewController: onSuccess key=\(key) name=\(name) subscriber=\(subscriber)")
        
        // TODO Safe details
        guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else {
            // TODO Show could not save alert
            self.displayUnexpectedErrorAlert(informaiveText: "Could not prepare dependencies for CoreData!")
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let entityName = "Accounts"
        guard let newEntity = NSEntityDescription.entity(forEntityName: entityName, in: context) else {
            return
        }
        
        let newAccount = NSManagedObject(entity: newEntity, insertInto: context)
        
        let accountId = UUID().uuidString
        newAccount.setValue(accountId, forKey: "accountId")
        newAccount.setValue(key, forKey: "key")
        newAccount.setValue(self.choosenScrobbler, forKey: "scrobbler")
        newAccount.setValue(self.scrobblerToken, forKey: "token")
        newAccount.setValue(name, forKey: "username")
        
        print("ConfirmAuthorizationViewController: newAccount=\(newAccount)")
        
        do {
            try context.save()
            print("Saved account with uid=\(accountId)")
            
            // Show saved account alert
            alert.alertStyle = NSAlert.Style.informational
            alert.messageText = "Successfully authorized as \(name) for \(scrobbler!.name)."
            alert.informativeText = "Wailer will now scrobble to your \(scrobbler!.name) account."
            self.displayAlert()
        } catch {
            print(error)
            
            // Show saving error alert
            alert.alertStyle = NSAlert.Style.critical
            alert.messageText = "Error saving account details."
            alert.informativeText = "Received session data looks good, but an error regaring saving appeared. Error description: \(error.localizedDescription)"
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
