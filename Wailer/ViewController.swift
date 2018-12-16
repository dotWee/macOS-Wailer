//
//  ViewController.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 16.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let settingsWindowController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "SettingsWindowController") as! SettingsWindowController

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func openSettingsWindowActionHandler(_ sender: NSButton) {
        settingsWindowController.showWindow(self)
    }
    
}

