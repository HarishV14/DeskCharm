//
//  CharmSelectionManager.swift
//  DeskCharm
//

import Foundation
import Combine

/// Single source of truth for the currently selected desktop charm.
final class CharmSelectionManager: ObservableObject {
    static let shared = CharmSelectionManager()
    
    /// The ID of the currently active charm. Defaults to "charm_blue_eye".
    @Published private(set) var selectedCharmId: String {
        didSet {
            UserDefaults.standard.set(selectedCharmId, forKey: "DeskCharm_SelectedCharmId")
        }
    }
    
    /// The currently active Charm model resolved from the catalog.
    var currentCharm: Charm {
        return CharmCatalog.shared.charm(withId: selectedCharmId)
            ?? CharmCatalog.shared.charms.first!
    }
    
    private init() {
        if let savedId = UserDefaults.standard.string(forKey: "DeskCharm_SelectedCharmId"),
           CharmCatalog.shared.charm(withId: savedId) != nil {
            self.selectedCharmId = savedId
        } else {
            self.selectedCharmId = "charm_blue_eye"
        }
    }
    
    /// Selects a new active charm by ID.
    func selectCharm(id: String) {
        guard CharmCatalog.shared.charm(withId: id) != nil else { return }
        selectedCharmId = id
    }
}
