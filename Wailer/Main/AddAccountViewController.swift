//
//  AddAccountViewController.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 26.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa
import Foundation
import Alamofire

class AddAccountViewController: NSViewController {
    lazy var choosenScrobbler: ScrobblerEndpoint = ScrobblerEndpoint.lastfm
    var scrobbler: ScrobblerProtocol?
    var scrobblerToken: String?
    var endpointsArray: NSArray = [ScrobblerEndpoint.lastfm, ScrobblerEndpoint.librefm]
    
    var authorizedAlert: NSAlert = NSAlert.init()
    
    lazy var authorizeAccountViewController: ConfirmAuthorizationViewController = {
        return self.storyboard!.instantiateController(withIdentifier: "ConfirmAuthorizationViewController")
            as! ConfirmAuthorizationViewController
    }()

    @IBOutlet weak var buttonAddLibreFmAccount: NSButton!
    @IBOutlet weak var buttonAddLastFmAccount: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AddAccountViewController: viewDidLoad")
        // Do view setup here.
    }
    
    @IBAction func buttonAddLastFmAccountActionHandler(_ sender: NSButton) {
        choosenScrobbler = ScrobblerEndpoint.lastfm
        addAccountActionHandler()
    }
    
    @IBAction func buttonAddLibreFmAccountActionHandler(_ sender: NSButton) {
        choosenScrobbler = ScrobblerEndpoint.librefm
        addAccountActionHandler()
    }
    
    override func dismiss(_ viewController: NSViewController) {
        print("AccountsViewController: dismiss \(viewController)")
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

extension AddAccountViewController: ScrobblerTokenHandshakeProtocol {
    
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
        authorizeAccountViewController.choosenScrobbler = choosenScrobbler
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
