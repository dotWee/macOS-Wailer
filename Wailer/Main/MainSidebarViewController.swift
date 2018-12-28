//
//  MainSidebarViewController.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 26.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa

class MainSidebarViewController: NSViewController {

    @IBOutlet weak var sidebar: NSOutlineView!
    
    // Dummy data used for row titles
    var items = ["Accounts", "Preferences"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainSidebarViewController: viewDidLoad")
        
        // Setup notification for window losing and gaining focus
        NotificationCenter.default.addObserver(self, selector: #selector(windowLostFocus), name: NSApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(windowGainedFocus), name: NSApplication.willBecomeActiveNotification, object: nil)
    }
}


extension MainSidebarViewController: NSOutlineViewDataSource {
    
    // Number of items in the sidebar
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        return items.count
    }
    
    // Items to be added to sidebar
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        return items[index]
    }
    
    // Whether rows are expandable by an arrow
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        return false
    }
    
    // Height of each row
    func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat {
        return 40.0
    }
    
    @objc func windowLostFocus(_ notification: Notification) {
        setRowColour(sidebar, false)
    }
    
    @objc func windowGainedFocus(_ notification: Notification) {
        setRowColour(sidebar, true)
    }
    
    // When a row is selected
    func outlineViewSelectionDidChange(_ notification: Notification) {
        print("MainSidebarViewController: outlineViewSelectionDidChange")
        
        if let outlineView = notification.object as? NSOutlineView {
            setRowColour(outlineView, true)
        }
    }
    
    func setRowColour(_ outlineView: NSOutlineView, _ windowFocused: Bool) {
        let rows = IndexSet(integersIn: 0..<outlineView.numberOfRows)
        let rowViews = rows.compactMap { outlineView.rowView(atRow: $0, makeIfNecessary: false) }
        var initialLoad = true
        
        // Iterate over each row in the outlineView
        for index in 0..<rowViews.count {
            print(index)
            
            let rowView = rowViews[index]
            if rowView.isSelected {
                self.onSelection(index: index)
                initialLoad = false
            }
            
            if windowFocused && rowView.isSelected {
                rowView.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            } else if rowView.isSelected {
                rowView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                rowView.backgroundColor = .clear
            }
        }
    
        if initialLoad {
            self.setInitialRowColour()
        }
    }
    
    func onSelection(index: Int) {
        print("MainSidebarViewController: onSelection index=\(index) value=\(self.items[index])")
        let itemValue = self.items[index]
        
        if (self.view.window != nil && self.mainWindowController == nil) {
            self.mainWindowController = self.view.window?.windowController as? MainWindowController
        }
        
        if (self.mainWindowController != nil) {
            switch itemValue {
            case items[1]:
                // Preferences
                //self.mainWindowController?.onSidebarSelectionPreferences(self)
                
            case items[0]:
                // Accounts
                //self.mainWindowController?.onSidebarSelectionAccounts(self)
            default:
                print("MainSidebarViewController: onSelection unknownValue=\(itemValue)")
            }
        }
    }
    
    func setInitialRowColour() {
        sidebar.rowView(atRow: 0, makeIfNecessary: true)?.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    }
    
    // Remove default selection colour
    func outlineView(_ outlineView: NSOutlineView, didAdd rowView: NSTableRowView, forRow row: Int) {
        rowView.selectionHighlightStyle = .none
    }
    
}

extension MainSidebarViewController: NSOutlineViewDelegate {
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        var view: NSTableCellView?
        
        if let title = item as? String {
            view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ItemCell"), owner: self) as? NSTableCellView
            if let textField = view?.textField {
                textField.stringValue = title
                textField.sizeToFit()
            }
        }
        
        return view
    }
    
}
