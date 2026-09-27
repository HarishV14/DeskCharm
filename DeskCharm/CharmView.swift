//
//  CharmView.swift
//  DeskCharm
//

import SwiftUI

/// Reusable SwiftUI view that renders an original blue lucky-bead charm.
struct CharmView: View {
    var body: some View {
        ZStack {
            // 1. Outer circular blue body with subtle darker blue outer edge
            Circle()
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [
                            Color(red: 0.15, green: 0.45, blue: 0.90), // Vibrant blue body
                            Color(red: 0.05, green: 0.25, blue: 0.70), // Deep blue mid-ring
                            Color(red: 0.02, green: 0.12, blue: 0.45)  // Subtle darker blue edge
                        ]),
                        center: UnitPoint(x: 0.45, y: 0.45),
                        startRadius: 0,
                        endRadius: 36
                    )
                )
                .overlay(
                    Circle()
                        .stroke(Color(red: 0.01, green: 0.08, blue: 0.35), lineWidth: 1.5)
                )

            // 2. Lighter blue inner circular area
            Circle()
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [
                            Color(red: 0.55, green: 0.82, blue: 1.00), // Light blue center
                            Color(red: 0.25, green: 0.60, blue: 0.95), // Vibrant sky-blue
                            Color(red: 0.10, green: 0.40, blue: 0.80)  // Outer blue ring
                        ]),
                        center: .center,
                        startRadius: 0,
                        endRadius: 20
                    )
                )
                .frame(width: 42, height: 42)

            // 3. Small white circular center
            Circle()
                .fill(Color.white)
                .frame(width: 24, height: 24)
                .shadow(color: Color.black.opacity(0.15), radius: 1, x: 0, y: 1)

            // 4. Small dark-blue or black center
            Circle()
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [
                            Color(red: 0.02, green: 0.05, blue: 0.15),
                            Color(red: 0.0, green: 0.0, blue: 0.05)
                        ]),
                        center: .center,
                        startRadius: 0,
                        endRadius: 6
                    )
                )
                .frame(width: 12, height: 12)

            // 5. Subtle glossy highlight for a polished, 3D bead appearance
            Ellipse()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(0.65),
                            Color.white.opacity(0.0)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 28, height: 14)
                .rotationEffect(.degrees(-35))
                .offset(x: -14, y: -18)

            // 6. Secondary soft glare highlight
            Circle()
                .fill(Color.white.opacity(0.20))
                .frame(width: 8, height: 8)
                .offset(x: 14, y: 16)
        }
        .frame(width: 72, height: 72)
        .shadow(color: Color.black.opacity(0.35), radius: 5, x: 0, y: 4)
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.3)
        CharmView()
    }
}
