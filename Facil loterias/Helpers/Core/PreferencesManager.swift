//
//  PreferencesManager.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 20/05/23.
//

import Foundation

struct PreferencesManager {
    
    
    //MARK: Properties
    
    static let shared = PreferencesManager()
    private let user = UserDefaults.standard
    private enum Keys: String {
        case sound = "sound"
        case notification = "notification"
    }
    public var notification: Bool {
        return PreferencesManager.shared.get(key: .notification) as? Bool ?? true
    }
    public var sound: Bool {
        return PreferencesManager.shared.get(key: .sound) as? Bool ?? true
    }

    
    
    //MARK: Public Methods

    public func changeNotification(status: Bool) {
        self.add(params: status, key: .notification)
    }
    
    public func changeSound(status: Bool) {
        self.add(params: status, key: .sound)
    }
    
    
    //MARK: Private Methods
 
    private func add(params: Any, key: Keys) {
        self.user.setValue(params, forKey: key.rawValue)
        self.user.synchronize()
    }
    
    private func remove(key: Keys) {
        self.user.removeObject(forKey: key.rawValue)
        self.user.synchronize()
    }
    
    private func get(key: Keys) -> Any {
        let rawValue = key.rawValue
        if(self.user.object(forKey: rawValue) as? NSObject != nil) {
            return self.user.object(forKey: rawValue) as! NSObject
        }
        
        return -1
    }
}
