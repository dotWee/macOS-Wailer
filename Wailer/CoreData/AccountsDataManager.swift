//
//  AccountsDataManager.swift
//  Wailer
//
//  Created by Lukas Wolfsteiner on 21.12.18.
//  Copyright © 2018 Lukas Wolfsteiner. All rights reserved.
//

import Cocoa

class AccountsDataManager: NSObject {
    static let entityName = "Accounts"
    
    static func saveNewAccount(key: String, token: String, username: String, scrobbler: ScrobblerEndpoint) -> String? {
        
        // TODO Safe details
        guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else {
            // TODO Show could not save alert
            return nil
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let entityName = "Accounts"
        guard let newEntity = NSEntityDescription.entity(forEntityName: entityName, in: context) else {
            return nil
        }
        
        let newAccount = NSManagedObject(entity: newEntity, insertInto: context)
        
        let accountId = UUID().uuidString
        newAccount.setValue(accountId, forKey: "accountId")
        newAccount.setValue(key, forKey: "key")
        newAccount.setValue(token, forKey: "token")
        newAccount.setValue(username, forKey: "username")
        newAccount.setValue(getIntFromScrobbler(scrobbler: scrobbler), forKey: "scrobbler")
        
        do {
            try context.save()
            return accountId
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getIntFromScrobbler(scrobbler: ScrobblerEndpoint) -> Int {
        switch scrobbler{
        case .lastfm:
            return 1
        case .librefm:
            return 2
        }
    }
    
    static func getScrobblerFromInt(scrobbler: Int) -> ScrobblerEndpoint {
        switch scrobbler {
        case 1:
            return ScrobblerEndpoint.lastfm
        case 2:
            return ScrobblerEndpoint.librefm
            
            
        default:
            return ScrobblerEndpoint.lastfm
        }
    }

    static func getAllAccountsSorted() -> [ScrobblerEndpoint: Set<NSManagedObject>]? {
        var endpointsAccounts: [ScrobblerEndpoint: Set<NSManagedObject>] = [
            ScrobblerEndpoint.lastfm: Set<NSManagedObject>(),
            ScrobblerEndpoint.librefm: Set<NSManagedObject>()
        ]
        
        let result = getAllAccounts()
        for data in result! {
            
            let scrobblerInt = data.value(forKey: "scrobbler") as! Int?
            let endpoint = AccountsDataManager.getScrobblerFromInt(scrobbler: scrobblerInt ?? 1)
            
            var endpointSet = endpointsAccounts[endpoint]
            endpointSet?.insert(data)
            endpointsAccounts[endpoint] = endpointSet
        }
        
        return endpointsAccounts;
    }
    
    static func getAllAccounts() -> [NSManagedObject]? {
        guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else {
            // TODO Show could not save alert
            //self.displayUnexpectedErrorAlert(informaiveText: "Could not prepare dependencies for CoreData!")
            return nil
        }
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        //request.predicate = NSPredicate(format: "scrobbler = %@", "\(scrobbler)")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            return result
        } catch {
            print("Failed")
            return nil
        }
    }
}
