//
//  CharmCategory.swift
//  DeskCharm
//

import Foundation

/// Represents a top-level category in the DeskCharm library catalog.
struct CharmCategory: Identifiable, Hashable, Codable {
    let id: String
    let name: String
    let iconName: String
    let categoryDescription: String
}

extension CharmCategory {
    static let featured = CharmCategory(
        id: "featured",
        name: "Featured",
        iconName: "star.fill",
        categoryDescription: "Popular and featured charms."
    )
    
    static let protectionAndSpiritual = CharmCategory(
        id: "protection_spiritual",
        name: "Protection & Spiritual",
        iconName: "shield.fill",
        categoryDescription: "Sacred and protective symbols from around the world."
    )
    
    static let indianCulture = CharmCategory(
        id: "indian_culture",
        name: "Indian Culture",
        iconName: "building.columns.fill",
        categoryDescription: "Traditional Indian and South Indian cultural icons."
    )
    
    static let nature = CharmCategory(
        id: "nature",
        name: "Nature",
        iconName: "leaf.fill",
        categoryDescription: "Flora, fauna, and natural elements."
    )
    
    static let luckAndFortune = CharmCategory(
        id: "luck_fortune",
        name: "Luck & Fortune",
        iconName: "sparkles",
        categoryDescription: "Lucky charms, coins, and fortune talismans."
    )
    
    static let seasonal = CharmCategory(
        id: "seasonal",
        name: "Seasonal",
        iconName: "calendar",
        categoryDescription: "Festive and seasonal holiday charms."
    )
    
    static let sports = CharmCategory(
        id: "sports",
        name: "Sports",
        iconName: "sportscourt.fill",
        categoryDescription: "Athletic and sports collectibles."
    )
    
    static let popCulture = CharmCategory(
        id: "pop_culture",
        name: "Pop Culture",
        iconName: "tv.fill",
        categoryDescription: "Entertainment and popular culture icons."
    )
    
    static let tamilCinema = CharmCategory(
        id: "tamil_cinema",
        name: "Tamil Cinema",
        iconName: "film.fill",
        categoryDescription: "Cinema and entertainment collections."
    )
    
    static let myCharms = CharmCategory(
        id: "my_charms",
        name: "My Charms",
        iconName: "person.crop.circle.fill",
        categoryDescription: "Your custom created charms."
    )
    
    static let allCategories: [CharmCategory] = [
        .featured,
        .protectionAndSpiritual,
        .indianCulture,
        .nature,
        .luckAndFortune,
        .seasonal,
        .sports,
        .popCulture,
        .tamilCinema,
        .myCharms
    ]
}
