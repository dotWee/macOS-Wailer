//
//  MainContentPageController.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 28.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa

class MainContentPageController: NSPageController, NSPageControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainContentPageController: viewDidLoad")
        // Do view setup here.
        
        delegate = self
        self.arrangedObjects = MainSidebarViewController.SIDEBAR_ITEMS
        self.transitionStyle = .horizontalStrip
    }
    
    func pageController(_ pageController: NSPageController, viewControllerForIdentifier identifier: String) -> NSViewController {
        
        switch identifier {
        case MainSidebarViewController.SIDEBAR_ACCOUNTS:
            return NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "MainAccountsViewController") as! NSViewController
        case MainSidebarViewController.SIDEBAR_PREFERENCES:
            return NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "MainPreferencesViewController") as! NSViewController
        default:
            return self.storyboard?.instantiateController(withIdentifier: identifier) as! NSViewController
        }
    }
    
    func pageController(_ pageController: NSPageController, identifierFor object: Any) -> String {
        return String(describing: object)
        
    }
    
    func pageControllerDidEndLiveTransition(_ pageController: NSPageController) {
        self.completeTransition()
        // TODO update row selection
    }
}

extension MainContentPageController: MainSidebarActionProtocol {
    
    func onSidebarSelectionAccounts(_ sender: MainSidebarViewController) {
        print("MainContentPageController: onSidebarSelectionAccounts")
        // TODO change view
    }
    
    func onSidebarSelectionPreferences(_ sender: MainSidebarViewController) {
        print("MainContentPageController: onSidebarSelectionPreferences")
        // TODO change view
    }
    
}
