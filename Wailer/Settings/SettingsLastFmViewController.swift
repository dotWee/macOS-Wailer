//
//  SettingsLastFmViewController.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 16.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa

class SettingsLastFmViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBOutlet weak var statusLabel: NSTextField!
    
    @IBOutlet weak var usernameTextField: NSTextField!
    
    @IBAction func usernameTextFieldActionHandler(_ sender: NSTextField) {
    }
    
    
    @IBOutlet weak var passwordTextField: NSSecureTextField!
    
    @IBAction func passwordTextFieldActionHandler(_ sender: NSSecureTextField) {
    }
    
    @IBAction func signInButtonActionHandler(_ sender: NSButton) {
    }
    
    @IBAction func resetButtonActionHandler(_ sender: NSButton) {
    }
    
    @IBOutlet weak var statusCircle: SettingsStatusCircleView!
}
