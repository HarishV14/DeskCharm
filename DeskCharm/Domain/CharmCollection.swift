//
//  CharmCollection.swift
//  DeskCharm
//

import Foundation

/// Represents a collection grouping inside a CharmCategory.
struct CharmCollection: Identifiable, Hashable, Codable {
    let id: String
    let name: String
    let categoryId: String
}

extension CharmCollection {
    // Protection & Spiritual
    static let nazar = CharmCollection(id: "col_nazar", name: "Nazar", categoryId: CharmCategory.protectionAndSpiritual.id)
    static let indianSpiritual = CharmCollection(id: "col_indian_spiritual", name: "Indian Spiritual", categoryId: CharmCategory.protectionAndSpiritual.id)
    static let worldSpiritual = CharmCollection(id: "col_world_spiritual", name: "World Spiritual", categoryId: CharmCategory.protectionAndSpiritual.id)
    
    // Indian Culture
    static let tamil = CharmCollection(id: "col_tamil", name: "Tamil", categoryId: CharmCategory.indianCulture.id)
    static let southIndian = CharmCollection(id: "col_south_indian", name: "South Indian", categoryId: CharmCategory.indianCulture.id)
    static let indianTraditional = CharmCollection(id: "col_indian_traditional", name: "Indian Traditional", categoryId: CharmCategory.indianCulture.id)
    
    // Sports
    static let football = CharmCollection(id: "col_football", name: "Football", categoryId: CharmCategory.sports.id)
    static let cricket = CharmCollection(id: "col_cricket", name: "Cricket", categoryId: CharmCategory.sports.id)
    static let otherSports = CharmCollection(id: "col_other_sports", name: "Other Sports", categoryId: CharmCategory.sports.id)
    
    // Cinema & Pop Culture
    static let tamilCinemaLicensed = CharmCollection(id: "col_tamil_cinema_licensed", name: "Licensed Collections", categoryId: CharmCategory.tamilCinema.id)
    static let popCultureLicensed = CharmCollection(id: "col_pop_culture_licensed", name: "Licensed Collections", categoryId: CharmCategory.popCulture.id)
}
