//
//  LibrarySettingsView.swift
//  DeskCharm
//

import SwiftUI

/// Tab selection within the Library view.
enum LibraryTab: String, CaseIterable, Identifiable {
    case charms = "Charms"
    case ropes = "Ropes"
    
    var id: String { rawValue }
}

/// View rendering the DeskCharm Charm Library screen.
struct LibrarySettingsView: View {
    @ObservedObject private var selectionManager = CharmSelectionManager.shared
    @State private var selectedLibraryTab: LibraryTab = .charms
    @State private var selectedCategoryFilter: String = "all" // "all", "favorites", or categoryId
    @State private var searchText: String = ""
    
    private let catalog = CharmCatalog.shared
    
    // Filtered charm list based on category & search text
    private var filteredCharms: [Charm] {
        let baseCharms: [Charm]
        
        if selectedCategoryFilter == "favorites" {
            baseCharms = catalog.charms.filter { $0.isFavorite }
        } else if selectedCategoryFilter == "all" {
            baseCharms = catalog.charms
        } else {
            baseCharms = catalog.charms(inCategory: selectedCategoryFilter)
        }
        
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if query.isEmpty {
            return baseCharms
        }
        
        return baseCharms.filter { charm in
            let matchesName = charm.name.lowercased().contains(query)
            let matchesTags = charm.tags.contains { $0.lowercased().contains(query) }
            let matchesRegion = charm.countryOrRegion?.lowercased().contains(query) ?? false
            
            let categoryName = catalog.categories.first(where: { $0.id == charm.categoryId })?.name.lowercased() ?? ""
            let matchesCategory = categoryName.contains(query)
            
            let collectionName = catalog.collections.first(where: { $0.id == charm.collectionId })?.name.lowercased() ?? ""
            let matchesCollection = collectionName.contains(query)
            
            return matchesName || matchesTags || matchesRegion || matchesCategory || matchesCollection
        }
    }
    
    // Currently selected charm for Header display
    private var activeCharm: Charm {
        return selectionManager.currentCharm
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Header & Tab Segmented Control
            VStack(alignment: .leading, spacing: 14) {
                HStack(alignment: .center) {
                    Text("Library")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Picker("Library Mode", selection: $selectedLibraryTab) {
                        ForEach(LibraryTab.allCases) { tab in
                            Text(tab.rawValue).tag(tab)
                        }
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()
                    .frame(width: 160)
                }
                
                if selectedLibraryTab == .charms {
                    // MARK: - Current Charm Header Section
                    let current = activeCharm
                    let glowColor = CharmAssetResolver.glowColor(for: current)
                    
                    HStack(spacing: 16) {
                            // Premium Charm Stage with dynamic ambient glow
                            ZStack {
                                RadialGradient(
                                    gradient: Gradient(colors: [
                                        glowColor.opacity(0.35),
                                        glowColor.opacity(0.08),
                                        Color.clear
                                    ]),
                                    center: .center,
                                    startRadius: 2,
                                    endRadius: 28
                                )
                                .blur(radius: 6)
                                
                                CharmAssetResolver.view(for: current)
                                    .scaleEffect(0.65)
                                    .shadow(color: glowColor.opacity(0.35), radius: 5, x: 0, y: 2)
                            }
                            .frame(width: 60, height: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    .fill(Color.black.opacity(0.25))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    .stroke(Color.white.opacity(0.12), lineWidth: 1)
                            )
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("CURRENT CHARM")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(.secondary)
                                    .tracking(0.5)
                                
                                Text(current.name)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                                if let region = current.countryOrRegion {
                                    Text(region)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            
                            Spacer()
                            
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.accentColor)
                                .font(.system(size: 22, weight: .bold))
                                .shadow(color: Color.accentColor.opacity(0.3), radius: 3, x: 0, y: 1)
                        }
                        .padding(12)
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(Color(NSColor.controlBackgroundColor).opacity(0.85))
                                
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .stroke(
                                        LinearGradient(
                                            colors: [Color.accentColor.opacity(0.35), Color.white.opacity(0.06)],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 1
                                    )
                            }
                        )
                }
            }
            .padding([.top, .horizontal], 20)
            .padding(.bottom, 12)
            
            Divider()
            
            if selectedLibraryTab == .charms {
                // MARK: - Search & Category Bar
                VStack(spacing: 10) {
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                        TextField("Search charms by name, category, or tags...", text: $searchText)
                            .textFieldStyle(.plain)
                        
                        if !searchText.isEmpty {
                            Button(action: { searchText = "" }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.secondary)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color(NSColor.controlBackgroundColor))
                    )
                    
                    // Category Selector Pills
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            CategoryPill(title: "All", isSelected: selectedCategoryFilter == "all") {
                                selectedCategoryFilter = "all"
                            }
                            
                            CategoryPill(title: "Favorites", isSelected: selectedCategoryFilter == "favorites") {
                                selectedCategoryFilter = "favorites"
                            }
                            
                            ForEach(catalog.categories) { category in
                                if category.id != "my_charms" && category.id != "featured" {
                                    CategoryPill(
                                        title: category.name,
                                        isSelected: selectedCategoryFilter == category.id
                                    ) {
                                        selectedCategoryFilter = category.id
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 2)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                Divider()
                
                // MARK: - Charm Grid Content
                ScrollView {
                    if filteredCharms.isEmpty {
                        VStack(spacing: 12) {
                            Spacer(minLength: 40)
                            
                            Image(systemName: selectedCategoryFilter == "favorites" ? "star.slash" : "magnifyingglass")
                                .font(.system(size: 36))
                                .foregroundColor(.secondary)
                            
                            Text(selectedCategoryFilter == "favorites" ? "No favorite charms yet" : "No charms found")
                                .font(.headline)
                            
                            Text(selectedCategoryFilter == "favorites" ? "Favorites will be implemented in a later milestone." : "Try another search query or category filter.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                            
                            Spacer(minLength: 40)
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity)
                    } else {
                        // Group by collections
                        let groupedByCollection = Dictionary(grouping: filteredCharms, by: { $0.collectionId ?? "other" })
                        
                        VStack(alignment: .leading, spacing: 20) {
                            ForEach(Array(groupedByCollection.keys), id: \.self) { collectionId in
                                if let collectionCharms = groupedByCollection[collectionId], !collectionCharms.isEmpty {
                                    VStack(alignment: .leading, spacing: 10) {
                                        if let collection = catalog.collections.first(where: { $0.id == collectionId }) {
                                            Text(collection.name)
                                                .font(.subheadline)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.secondary)
                                        }
                                        
                                        LazyVGrid(
                                            columns: [GridItem(.adaptive(minimum: 140, maximum: 180), spacing: 14)],
                                            spacing: 14
                                        ) {
                                            ForEach(collectionCharms) { charm in
                                                CharmCardView(
                                                    charm: charm,
                                                    isSelected: selectionManager.selectedCharmId == charm.id
                                                ) {
                                                    withAnimation(.easeInOut(duration: 0.18)) {
                                                        selectionManager.selectCharm(id: charm.id)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding(20)
                    }
                }
            } else {
                // MARK: - Rope Library Placeholder
                VStack(spacing: 16) {
                    Spacer()
                    
                    Image(systemName: "line.3.horizontal")
                        .font(.system(size: 44))
                        .foregroundColor(.secondary)
                    
                    Text("Rope Library")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Rope customization will be available soon.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

/// Helper view rendering a category filter pill button.
struct CategoryPill: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 12, weight: isSelected ? .semibold : .regular))
                .padding(.horizontal, 12)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .fill(isSelected ? Color.accentColor : Color(NSColor.controlBackgroundColor))
                )
                .foregroundColor(isSelected ? .white : .primary)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    LibrarySettingsView()
}
