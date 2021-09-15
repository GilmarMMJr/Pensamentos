//
//  Configuration.swift
//  Pensamentos
//
//  Created by Gilmar Junior on 15/09/21.
//

import Foundation

enum UserDefaultKeys: String {
    case timeInterval = "timeInterval"
    case colorScheme = "colorScheme"
    case autoRefresh = "autoRefresh"
}

class Configuration {
    
    let defaults = UserDefaults.standard
    static var shared: Configuration = Configuration()
    
    var timeInterval: Double {
        get {
            return defaults.double(forKey: UserDefaultKeys.timeInterval.rawValue)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultKeys.timeInterval.rawValue)
        }
    }
    
    var colorScheme: Int {
        get {
            return defaults.integer(forKey: UserDefaultKeys.colorScheme.rawValue)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultKeys.colorScheme.rawValue)
        }
    }
    
    var autoRefresh: Bool {
        get {
            return defaults.bool(forKey: UserDefaultKeys.autoRefresh.rawValue)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultKeys.autoRefresh.rawValue)
        }
    }
    

    private init() {
        if defaults.double(forKey: UserDefaultKeys.timeInterval.rawValue) == 0 {
            defaults.set(8.0, forKey: UserDefaultKeys.timeInterval.rawValue)
        }
    }
    
    
    
    
    
}
