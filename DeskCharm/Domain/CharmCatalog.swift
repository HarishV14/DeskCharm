//
//  CharmCatalog.swift
//  DeskCharm
//

import Foundation

/// Local catalog providing access to DeskCharm categories, collections, and catalog charms.
struct CharmCatalog {
    static let shared = CharmCatalog()
    
    let categories: [CharmCategory]
    let collections: [CharmCollection]
    private(set) var charms: [Charm]
    
    init() {
        self.categories = CharmCategory.allCategories
        self.collections = [
            .nazar, .indianSpiritual, .worldSpiritual,
            .tamil, .southIndian, .indianTraditional,
            .football, .cricket, .otherSports,
            .tamilCinemaLicensed, .popCultureLicensed
        ]
        
        self.charms = [
            // 1. Blue Lucky Eye (Nazar)
            Charm(
                id: "charm_blue_eye",
                name: "Blue Lucky Eye",
                categoryId: CharmCategory.protectionAndSpiritual.id,
                collectionId: CharmCollection.nazar.id,
                assetIdentifier: "charm_blue_eye",
                countryOrRegion: "Mediterranean / Anatolia",
                tags: ["eye", "nazar", "protection", "blue", "lucky"],
                originType: .builtIn,
                isFavorite: true
            ),
            
            // 2. Hamsa Hand
            Charm(
                id: "charm_hamsa",
                name: "Hamsa Hand",
                categoryId: CharmCategory.protectionAndSpiritual.id,
                collectionId: CharmCollection.worldSpiritual.id,
                assetIdentifier: "charm_hamsa",
                countryOrRegion: "Middle East / North Africa",
                tags: ["hamsa", "protection", "hand", "spiritual", "gold"],
                originType: .builtIn
            ),
            
            // 3. Drishti Bommai
            Charm(
                id: "charm_drishti_bommai",
                name: "Drishti Bommai",
                categoryId: CharmCategory.protectionAndSpiritual.id,
                collectionId: CharmCollection.southIndian.id,
                assetIdentifier: "charm_drishti_bommai",
                countryOrRegion: "South India",
                tags: ["drishti", "bommai", "mask", "protection", "tamil"],
                originType: .builtIn
            ),
            
            // 4. Nimbu-Mirchi
            Charm(
                id: "charm_nimbu_mirchi",
                name: "Nimbu-Mirchi",
                categoryId: CharmCategory.protectionAndSpiritual.id,
                collectionId: CharmCollection.indianSpiritual.id,
                assetIdentifier: "charm_nimbu_mirchi",
                countryOrRegion: "India",
                tags: ["lemon", "chili", "nimbu", "mirchi", "protection", "traditional"],
                originType: .builtIn
            ),
            
            // 5. Dream Catcher
            Charm(
                id: "charm_dream_catcher",
                name: "Dream Catcher",
                categoryId: CharmCategory.protectionAndSpiritual.id,
                collectionId: CharmCollection.worldSpiritual.id,
                assetIdentifier: "charm_dream_catcher",
                countryOrRegion: "Native America",
                tags: ["dreamcatcher", "feathers", "protection", "web", "sleep"],
                originType: .builtIn
            ),
            
            // 6. Chinese Knot
            Charm(
                id: "charm_chinese_knot",
                name: "Chinese Knot",
                categoryId: CharmCategory.protectionAndSpiritual.id,
                collectionId: CharmCollection.worldSpiritual.id,
                assetIdentifier: "charm_chinese_knot",
                countryOrRegion: "China / East Asia",
                tags: ["knot", "red", "jade", "luck", "fortune", "silk"],
                originType: .builtIn
            ),
            
            // 7. Daruma Doll
            Charm(
                id: "charm_daruma",
                name: "Daruma Doll",
                categoryId: CharmCategory.protectionAndSpiritual.id,
                collectionId: CharmCollection.worldSpiritual.id,
                assetIdentifier: "charm_daruma",
                countryOrRegion: "Japan",
                tags: ["daruma", "doll", "red", "perseverance", "luck"],
                originType: .builtIn
            ),
            
            // 8. Maneki-neko
            Charm(
                id: "charm_maneki_neko",
                name: "Maneki-neko",
                categoryId: CharmCategory.protectionAndSpiritual.id,
                collectionId: CharmCollection.worldSpiritual.id,
                assetIdentifier: "charm_maneki_neko",
                countryOrRegion: "Japan",
                tags: ["cat", "lucky", "manekineko", "gold", "fortune"],
                originType: .builtIn
            ),
            
            // 9. Temple Bell
            Charm(
                id: "charm_temple_bell",
                name: "Sacred Temple Bell",
                categoryId: CharmCategory.protectionAndSpiritual.id,
                collectionId: CharmCollection.southIndian.id,
                assetIdentifier: "charm_temple_bell",
                countryOrRegion: "Tamil Nadu, India",
                tags: ["bell", "temple", "brass", "spiritual", "sound"],
                originType: .builtIn
            ),
            
            // 10. Sacred Lotus
            Charm(
                id: "charm_lotus",
                name: "Sacred Lotus",
                categoryId: CharmCategory.nature.id,
                collectionId: CharmCollection.indianTraditional.id,
                assetIdentifier: "charm_lotus",
                countryOrRegion: "India",
                tags: ["lotus", "flower", "nature", "purity"],
                originType: .builtIn
            ),
            
            // 11. Lucky Coin
            Charm(
                id: "charm_lucky_coin",
                name: "Golden Lucky Coin",
                categoryId: CharmCategory.luckAndFortune.id,
                collectionId: CharmCollection.worldSpiritual.id,
                assetIdentifier: "charm_lucky_coin",
                countryOrRegion: "Global",
                tags: ["coin", "gold", "luck", "fortune"],
                originType: .builtIn
            ),
            
            // 12. Celestial Moon
            Charm(
                id: "charm_moon",
                name: "Celestial Moon",
                categoryId: CharmCategory.nature.id,
                collectionId: CharmCollection.worldSpiritual.id,
                assetIdentifier: "charm_moon",
                countryOrRegion: "Global",
                tags: ["moon", "sky", "celestial", "night"],
                originType: .builtIn
            ),
            
            // 13. Golden Star
            Charm(
                id: "charm_star",
                name: "Golden Star",
                categoryId: CharmCategory.luckAndFortune.id,
                collectionId: CharmCollection.worldSpiritual.id,
                assetIdentifier: "charm_star",
                countryOrRegion: "Global",
                tags: ["star", "gold", "shining", "luck"],
                originType: .builtIn
            ),
            
            // 14. Traditional Protective Lemon
            Charm(
                id: "charm_lemon",
                name: "Protective Lemon",
                categoryId: CharmCategory.indianCulture.id,
                collectionId: CharmCollection.tamil.id,
                assetIdentifier: "charm_lemon",
                countryOrRegion: "Tamil Nadu, India",
                tags: ["lemon", "protection", "traditional", "nazar"],
                originType: .builtIn
            )
        ]
    }
    
    /// Finds a charm by its unique ID.
    func charm(withId id: String) -> Charm? {
        return charms.first { $0.id == id }
    }
    
    /// Returns all charms belonging to a given category ID.
    func charms(inCategory categoryId: String) -> [Charm] {
        return charms.filter { $0.categoryId == categoryId }
    }
    
    /// Returns all charms belonging to a given collection ID.
    func charms(inCollection collectionId: String) -> [Charm] {
        return charms.filter { $0.collectionId == collectionId }
    }
}
