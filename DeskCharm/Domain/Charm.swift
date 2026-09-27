//
//  Charm.swift
//  DeskCharm
//

import Foundation

/// Extensible domain model representing a single charm collectible item.
struct Charm: Identifiable, Hashable, Codable {
    let id: String
    let name: String
    let categoryId: String
    let collectionId: String?
    let assetIdentifier: String
    let countryOrRegion: String?
    let tags: [String]
    let originType: CharmOriginType
    var isFavorite: Bool
    
    var isUserCreated: Bool {
        return originType.isUserCreated
    }
    
    var isBuiltIn: Bool {
        return originType.isBuiltIn
    }
    
    init(
        id: String,
        name: String,
        categoryId: String,
        collectionId: String? = nil,
        assetIdentifier: String,
        countryOrRegion: String? = nil,
        tags: [String] = [],
        originType: CharmOriginType = .builtIn,
        isFavorite: Bool = false
    ) {
        self.id = id
        self.name = name
        self.categoryId = categoryId
        self.collectionId = collectionId
        self.assetIdentifier = assetIdentifier
        self.countryOrRegion = countryOrRegion
        self.tags = tags
        self.originType = originType
        self.isFavorite = isFavorite
    }
}
