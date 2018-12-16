//
//  SettingsLibreFmViewController.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 16.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa

class SettingsLibreFmViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    @IBOutlet weak var statusLabel: NSTextField!
    
    @IBOutlet weak var usernameTextField: NSTextField!
    
    @IBAction func usernameTextFieldActionHandler(_ sender: NSTextFieldCell) {
    }
    @IBOutlet weak var passwordTextField: NSSecureTextField!
    
    @IBAction func passwordTextFieldActionHandler(_ sender: NSSecureTextField) {
    }
    
    @IBAction func signInButtonActionHandler(_ sender: NSButton) {
    }
    @IBOutlet weak var statusCircle: SettingsStatusCircleView!
    
    @IBAction func resetButtonActionHandler(_ sender: NSButton) {
    }
}
