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
    var endpointAccounts: [ScrobblerEndpoint: Array<NSManagedObject>] = [:]
    var endpoints: [ScrobblerEndpoint] = [
        ScrobblerEndpoint.lastfm,
        ScrobblerEndpoint.librefm
    ]
    
    @IBOutlet weak var sourceView: NSOutlineView!
    
    lazy var choosenScrobbler: ScrobblerEndpoint = ScrobblerEndpoint.lastfm
    var scrobbler: ScrobblerProtocol?
    var scrobblerToken: String?
    var endpointsArray: NSArray = [ScrobblerEndpoint.lastfm, ScrobblerEndpoint.librefm]
    
    var authorizedAlert: NSAlert = NSAlert.init()
    
    lazy var authorizeAccountViewController: ConfirmAuthorizationViewController = {
        return self.storyboard!.instantiateController(withIdentifier: "ConfirmAuthorizationViewController")
            as! ConfirmAuthorizationViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do view setup here.
        
        sourceView.dataSource = self
        sourceView.delegate = self
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

extension AccountsViewController: NSOutlineViewDelegate {
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        var view: NSTableCellView?
        
        if item is ScrobblerEndpoint {
            view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier.init("HeaderCell"), owner: self) as? NSTableCellView
            
            if let textField = view!.textField {
                textField.stringValue = (item as! ScrobblerEndpoint == ScrobblerEndpoint.lastfm ? LastFmScrobbler.init().name : LibreFmScrobbler.init().name)
            }
        } else {
            view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier.init("DataCell"), owner: self) as? NSTableCellView
            
            if let textField = view!.textField {
                textField.stringValue = (item as! NSManagedObject).value(forKey: "username") as! String
            }
        }
        
        return view
    }
}

extension AccountsViewController: NSOutlineViewDataSource {
    
    func loadAccounts() {
        let result = AccountsDataManager.getAllAccountsSorted()
        
        self.endpointAccounts = [
            ScrobblerEndpoint.lastfm: Array(result![ScrobblerEndpoint.lastfm]!),
            ScrobblerEndpoint.librefm: Array(result![ScrobblerEndpoint.librefm]!)
        ]
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        if item is ScrobblerEndpoint {
            let accounts = self.endpointAccounts[item as! ScrobblerEndpoint]
            if accounts != nil {
                return true
            }
        }
        
        return false
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let endpoint = item as? ScrobblerEndpoint {
            // Account of Index for endpoint
            let accounts = self.endpointAccounts[endpoint]
            return accounts![index]
        }
        
        return self.endpoints[index]
    }
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let endpoint = item as? ScrobblerEndpoint {
            // Count of accounts for endpoint
            
            let accounts = self.endpointAccounts[endpoint]
            if accounts == nil {
                return 0
            } else {
                return accounts!.count
            }
        }
        
        // Count of endpoints
        return self.endpoints.count
    }
    
}
