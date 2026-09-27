//
//  SettingsRootView.swift
//  DeskCharm
//

import SwiftUI

/// Enumeration of sidebar navigation tabs for DeskCharm Settings.
enum SettingsTab: String, CaseIterable, Identifiable {
    case general = "General"
    case appearance = "Appearance"
    case library = "Library"
    case create = "Create"
    case about = "About"
    
    var id: String { rawValue }
    
    var iconName: String {
        switch self {
        case .general: return "gearshape"
        case .appearance: return "paintpalette"
        case .library: return "square.grid.2x2"
        case .create: return "plus.circle"
        case .about: return "info.circle"
        }
    }
}

/// Root view rendering the sidebar navigation layout for DeskCharm Settings.
struct SettingsRootView: View {
    @State private var selectedTab: SettingsTab? = .general
    
    var body: some View {
        NavigationSplitView {
            List(SettingsTab.allCases, selection: $selectedTab) { tab in
                NavigationLink(value: tab) {
                    Label(tab.rawValue, systemImage: tab.iconName)
                }
            }
            .listStyle(.sidebar)
            .navigationSplitViewColumnWidth(min: 160, ideal: 180, max: 220)
        } detail: {
            if let tab = selectedTab {
                switch tab {
                case .general:
                    GeneralSettingsView()
                case .appearance:
                    AppearanceSettingsView()
                case .library:
                    LibrarySettingsView()
                case .create:
                    CreateSettingsView()
                case .about:
                    AboutSettingsView()
                }
            } else {
                GeneralSettingsView()
            }
        }
        .frame(minWidth: 550, minHeight: 350)
    }
}

#Preview {
    SettingsRootView()
}
