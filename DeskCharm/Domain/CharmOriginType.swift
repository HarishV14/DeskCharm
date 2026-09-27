//
//  CharmOriginType.swift
//  DeskCharm
//

import Foundation

/// Represents the origin and licensing status of a charm artwork asset.
enum CharmOriginType: Hashable, Codable {
    case builtIn
    case licensed(publisher: String)
    case userCreated
    
    var isBuiltIn: Bool {
        if case .builtIn = self { return true }
        return false
    }
    
    var isUserCreated: Bool {
        if case .userCreated = self { return true }
        return false
    }
    
    var isLicensed: Bool {
        if case .licensed = self { return true }
        return false
    }
}
