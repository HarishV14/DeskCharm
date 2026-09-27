//
//  CharmCardView.swift
//  DeskCharm
//

import SwiftUI

/// Premium charm card displaying transparent charm artwork with dynamic ambient glow,
/// macOS hover interactions, and clear selection state.
struct CharmCardView: View {
    let charm: Charm
    let isSelected: Bool
    let onSelect: () -> Void
    
    @State private var isHovered = false
    
    // Dynamic glow color matching the charm identity
    private var primaryGlowColor: Color {
        CharmAssetResolver.glowColor(for: charm)
    }
    
    var body: some View {
        Button(action: onSelect) {
            VStack(alignment: .center, spacing: 10) {
                // MARK: - Artwork Stage Area
                ZStack {
                    // 1. Dynamic Ambient Radial Glow behind the artwork
                    RadialGradient(
                        gradient: Gradient(colors: [
                            primaryGlowColor.opacity(isSelected ? 0.38 : (isHovered ? 0.28 : 0.15)),
                            primaryGlowColor.opacity(isSelected ? 0.14 : (isHovered ? 0.09 : 0.03)),
                            Color.clear
                        ]),
                        center: .center,
                        startRadius: 4,
                        endRadius: isHovered ? 52 : 44
                    )
                    .blur(radius: isHovered ? 12 : 8)
                    
                    // 2. Real Transparent Charm Artwork with preserved aspect ratio
                    CharmAssetResolver.view(for: charm)
                        .scaleEffect(isHovered ? 1.08 : (isSelected ? 1.04 : 1.0))
                        .shadow(
                            color: primaryGlowColor.opacity(isSelected ? 0.45 : (isHovered ? 0.32 : 0.20)),
                            radius: isHovered ? 9 : 5,
                            x: 0,
                            y: isHovered ? 5 : 3
                        )
                }
                .frame(height: 106)
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                
                // MARK: - Metadata Text Area
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
            .padding(.top, 12)
            .padding(.bottom, 14)
            .padding(.horizontal, 10)
            .background(
                ZStack {
                    // Translucent dark premium card surface
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(NSColor.controlBackgroundColor).opacity(isHovered ? 0.90 : 0.75),
                                    Color(NSColor.windowBackgroundColor).opacity(isHovered ? 0.95 : 0.80)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    // Subtle inner top highlight border
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(isHovered ? 0.16 : 0.08),
                                    Color.white.opacity(0.02)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            lineWidth: 1
                        )
                }
            )
            .overlay(
                // Selection / Hover Highlight Border
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(
                        isSelected ? Color.accentColor : (isHovered ? Color.white.opacity(0.25) : Color.primary.opacity(0.06)),
                        lineWidth: isSelected ? 2.0 : 1.0
                    )
            )
            .overlay(
                // Selection Indicator Badge
                Group {
                    if isSelected {
                        VStack {
                            HStack {
                                Spacer()
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.accentColor)
                                    .background(Circle().fill(Color.white).padding(2))
                                    .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 1)
                            }
                            Spacer()
                        }
                        .padding(8)
                    }
                }
            )
            .shadow(
                color: Color.black.opacity(isHovered ? 0.25 : 0.12),
                radius: isHovered ? 10 : 4,
                x: 0,
                y: isHovered ? 5 : 2
            )
            .offset(y: isHovered ? -2 : 0)
        }
        .buttonStyle(.plain)
        .onHover { hovering in
            withAnimation(.easeInOut(duration: 0.18)) {
                isHovered = hovering
            }
        }
        .accessibilityLabel("\(charm.name), \(isSelected ? "Selected" : "")")
        .accessibilityAddTraits(isSelected ? [.isSelected] : [])
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
