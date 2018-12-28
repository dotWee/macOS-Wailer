//
//  MainWindowController.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 26.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    var mainSidebarViewController: MainSidebarViewController?
    var mainContentViewController: MainContentViewController?

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
}

extension MainWindowController: MainSidebarActionProtocol {
    
    func onSidebarSelectionAccounts(_ sender: MainSidebarViewController) {
        print("MainWindowController: onSidebarSelectionAccounts")
        if (mainContentViewController != nil) {
            mainContentViewController?.onSidebarSelectionPreferences(sender)
        } else {
            print("MainWindowController: onSidebarSelectionAccounts NIL CONTROLLER")
        }
    }
    
    func onSidebarSelectionPreferences(_ sender: MainSidebarViewController) {
        print("MainWindowController: onSidebarSelectionPreferences")
        if (mainContentViewController != nil) {
            mainContentViewController?.onSidebarSelectionPreferences(sender)
        } else {
            print("MainWindowController: onSidebarSelectionPreferences NIL CONTROLLER")
        }
    }
    
}
