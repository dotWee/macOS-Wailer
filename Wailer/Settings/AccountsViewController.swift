//
//  AccountsViewController.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 16.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa
import Foundation
import Alamofire

class AccountsViewController: NSViewController {
    
    lazy var choosenScrobbler: ScrobblerEndpoint = ScrobblerEndpoint.lastfm
    var scrobbler: ScrobblerProtocol?
    var scrobblerToken: String?
    
    var authorizedAlert: NSAlert = NSAlert.init()
    
    lazy var authorizeAccountViewController: ConfirmAuthorizationViewController = {
        return self.storyboard!.instantiateController(withIdentifier: "ConfirmAuthorizationViewController")
            as! ConfirmAuthorizationViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func addLastFmAccountActionHandler(_ sender: NSButton) {
        choosenScrobbler = ScrobblerEndpoint.lastfm
        addAccountActionHandler()
    }
    
    @IBAction func addLibreFmAccountActionHandler(_ sender: NSButton) {
        choosenScrobbler = ScrobblerEndpoint.librefm
        addAccountActionHandler()
    }
    
    override func dismiss(_ viewController: NSViewController) {
        print("AccountsViewController: dismiss \(viewController)")
    }
    
    func displayAuthorizationPerformedAlert() {
        
    }
    
    func addAccountActionHandler() {
        
        // 1. Request Token and wait for response
        switch choosenScrobbler {
        case .lastfm:
            scrobbler = LastFmScrobbler.init()
        case .librefm:
            scrobbler = LibreFmScrobbler.init()
        }
        
        scrobbler?.performTokenRequest(handshakeProtocol: self)
    }
}

extension AccountsViewController: ScrobblerTokenHandshakeProtocol {
    
    func onSuccess(token: String) {
        print("AccountsViewController: onSuccess token=\(token)")
        
        // 2. Open Browser
        // TODO Make protocol function
        switch choosenScrobbler {
        case .lastfm:
            LastFmScrobbler.openAuthUrl(token: token)
        case .librefm:
            LibreFmScrobbler.openAuthUrl(token: token)
        }
        
        self.scrobblerToken = token
        
        
        // 3. Show confirm auth sheet
        authorizeAccountViewController.scrobbler = self.scrobbler
        authorizeAccountViewController.scrobblerToken = token
        self.presentAsSheet(authorizeAccountViewController)
    }
    
    func onError(code: Int, message: String) {
        print("AccountsViewController: onError code=\(code) message=\(message)")
        // TODO Show error message
    }
    
    func onError(result: Result<Any>) {
        print("AccountsViewController: onError result=\(result)")
        // TODO Show error message
    }
}
