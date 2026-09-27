//
//  CharmAssetResolver.swift
//  DeskCharm
//

import SwiftUI

/// Abstract asset resolver decoupling charm domain models from SwiftUI/image rendering.
enum CharmAssetResolver {
    /// Resolves a Charm to a SwiftUI view representation.
    @ViewBuilder
    static func view(for charm: Charm) -> some View {
        switch charm.assetIdentifier {
        case "charm_blue_eye":
            CharmView()
        default:
            // Placeholder rendering for future premium 3D charm assets
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Color.blue.opacity(0.8), Color.indigo.opacity(0.9)],
                            center: .center,
                            startRadius: 0,
                            endRadius: 36
                        )
                    )
                
                Image(systemName: "sparkles")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
            }
            .frame(width: 72, height: 72)
            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 3)
        }
    }
}
