//
//  MainContentViewController.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 26.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa

class MainContentViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainContentViewController")
        // Do view setup here.
    
        /*
        let mainAccountsViewController = MainAccountsViewController.init(nibName: "MainAccountsViewController", bundle: nil)
        addChild(mainAccountsViewController)
        containerView.addSubview(mainAccountsViewController.view)
        mainAccountsViewController.view.frame = view.bounds
        */
    }
    
    @IBOutlet weak var containerView: NSView!
    
}
