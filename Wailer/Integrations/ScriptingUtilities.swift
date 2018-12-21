//
//  ScriptingUtilities.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 22.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa
import Foundation
import ScriptingBridge

class ScriptingUtilities: NSObject {
    
    public static let defaultAppLocations = [
        "/Applications",
        "/Applications/Utilities",
        "/System/Library/CoreServices"
    ]
    
    public static func appPathForName(_ name: String, locations: [String] = defaultAppLocations) -> String? {
        var path: String?
        for location in locations {
            let possiblePath = "\(location)/\(name).app"
            var isDirectory = ObjCBool(false)
            if FileManager.default.fileExists(atPath: possiblePath, isDirectory: &isDirectory) && isDirectory.boolValue {
                path = possiblePath
                break
            }
        }
        
        return path
    }
    
    public static func application(bundleIdentifier: String) -> AnyObject? {
        return SBApplication(bundleIdentifier: bundleIdentifier)
    }
    
    public static func application(path: String) -> AnyObject? {
        var app: AnyObject?
        if let bundle = Bundle(path: path) {
            app = application(bundleIdentifier: bundle.bundleIdentifier!)
        }
        
        return app
    }
    
    public static func application(name: String, locations: [String] = defaultAppLocations) -> AnyObject? {
        var app: AnyObject?
        if let path = appPathForName(name, locations: locations) {
            app = application(path: path)
        }
        
        return app
    }
    
    public static func objectWithApplication(_ application: AnyObject, scriptingClass: String, properties: [AnyHashable: Any] = [:]) -> SBObject! {
        let theClass = (application as! SBApplication).class(forScriptingClass: scriptingClass) as! SBObject.Type
        return theClass.init(properties: properties)
    }
    
    public static func objectWithApplication<T: RawRepresentable>(_ application: AnyObject, scriptingClass: T, properties: [AnyHashable: Any] = [:]) -> SBObject! {
        return objectWithApplication(application, scriptingClass: (scriptingClass.rawValue as! String), properties: properties)
    }

}
