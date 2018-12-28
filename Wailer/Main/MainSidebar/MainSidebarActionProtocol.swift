//
//  MainSidebarActionProtocol.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 27.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa

protocol MainSidebarActionProtocol {

    func onSidebarSelectionAccounts(_ sender: MainSidebarViewController)
    func onSidebarSelectionPreferences(_ sender: MainSidebarViewController)

}
