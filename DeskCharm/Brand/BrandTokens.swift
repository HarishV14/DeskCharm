//
//  BrandTokens.swift
//  DeskCharm
//

import SwiftUI

/// Centralized brand design tokens for DeskCharm.
enum BrandTokens {
    // MARK: - Colors
    static let primaryGradientStart = Color(red: 0.22, green: 0.25, blue: 0.75) // Deep Royal Indigo
    static let primaryGradientEnd = Color(red: 0.10, green: 0.75, blue: 0.95)   // Radiant Cyan
    static let accentGlow = Color(red: 0.40, green: 0.85, blue: 1.00)           // Glowing Aqua
    
    static let darkBackground = Color(red: 0.08, green: 0.09, blue: 0.15)
    static let lightBackground = Color(red: 0.96, green: 0.97, blue: 0.99)
    
    // MARK: - Brand Strings
    static let brandName = "DeskCharm"
    static let developerName = "Harish V"
    static let copyrightNotice = "© 2026 Harish V"
    static let versionString = "Version 1.0"
    static let tagline = "A small hanging charm for your desktop."
}
