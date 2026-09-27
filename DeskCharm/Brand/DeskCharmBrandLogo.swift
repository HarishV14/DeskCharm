//
//  DeskCharmBrandLogo.swift
//  DeskCharm
//

import SwiftUI

/// Reusable SwiftUI view rendering the official DeskCharm brand logo mark.
struct DeskCharmBrandLogo: View {
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let scale = size / 100.0
            
            ZStack {
                // 1. Top Suspension Ring / Bail
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [BrandTokens.accentGlow, BrandTokens.primaryGradientEnd],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2.5 * scale
                    )
                    .frame(width: 14 * scale, height: 14 * scale)
                    .offset(y: -36 * scale)
                
                // 2. Connecting cord
                Capsule()
                    .fill(BrandTokens.primaryGradientEnd)
                    .frame(width: 2.0 * scale, height: 10 * scale)
                    .offset(y: -26 * scale)
                
                // 3. Main Geometric Diamond Shield Body
                RoundedRectangle(cornerRadius: 14 * scale, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [BrandTokens.primaryGradientStart, BrandTokens.primaryGradientEnd],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 52 * scale, height: 52 * scale)
                    .rotationEffect(.degrees(45))
                    .offset(y: 4 * scale)
                    .shadow(color: BrandTokens.primaryGradientStart.opacity(0.4), radius: 6 * scale, x: 0, y: 4 * scale)
                
                // 4. Inner Glowing Ring
                Circle()
                    .stroke(Color.white.opacity(0.85), lineWidth: 2.0 * scale)
                    .frame(width: 28 * scale, height: 28 * scale)
                    .offset(y: 4 * scale)
                
                // 5. Center Core Accent
                Circle()
                    .fill(Color.white)
                    .frame(width: 12 * scale, height: 12 * scale)
                    .offset(y: 4 * scale)
                    .shadow(color: .white.opacity(0.8), radius: 2 * scale)
                
                // 6. Glossy Specular Sheen
                Ellipse()
                    .fill(
                        LinearGradient(
                            colors: [Color.white.opacity(0.55), Color.white.opacity(0.0)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 24 * scale, height: 12 * scale)
                    .rotationEffect(.degrees(-35))
                    .offset(x: -10 * scale, y: -8 * scale)
            }
            .frame(width: size, height: size, alignment: .center)
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2)
        DeskCharmBrandLogo()
            .frame(width: 128, height: 128)
    }
}
