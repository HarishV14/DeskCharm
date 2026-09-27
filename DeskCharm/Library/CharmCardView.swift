//
//  CharmCardView.swift
//  DeskCharm
//

import SwiftUI

/// Reusable card view rendering individual charm artwork and catalog metadata.
struct CharmCardView: View {
    let charm: Charm
    let isSelected: Bool
    let onSelect: () -> Void
    
    var body: some View {
        Button(action: onSelect) {
            VStack(spacing: 10) {
                // Charm Artwork Container
                ZStack {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color.secondary.opacity(0.08))
                    
                    CharmAssetResolver.view(for: charm)
                        .scaleEffect(0.9)
                }
                .frame(height: 96)
                
                // Text Metadata
                VStack(spacing: 3) {
                    Text(charm.name)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    
                    if let region = charm.countryOrRegion {
                        Text(region)
                            .font(.system(size: 11))
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    } else if let collectionId = charm.collectionId,
                              let collection = CharmCatalog.shared.collections.first(where: { $0.id == collectionId }) {
                        Text(collection.name)
                            .font(.system(size: 11))
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                }
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(isSelected ? Color.accentColor.opacity(0.1) : Color(NSColor.controlBackgroundColor))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(isSelected ? Color.accentColor : Color.primary.opacity(0.08), lineWidth: isSelected ? 2.0 : 1.0)
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CharmCardView(
        charm: CharmCatalog.shared.charms.first!,
        isSelected: true,
        onSelect: {}
    )
    .frame(width: 160)
    .padding()
}
