//
//  RopeView.swift
//  DeskCharm
//

import SwiftUI

/// Reusable SwiftUI view rendering the vertical hanging rope with dynamic height.
struct RopeView: View {
    var width: CGFloat = 2.5
    var height: CGFloat = 120

    var body: some View {
        Capsule()
            .fill(Color.primary.opacity(0.8))
            .frame(width: width, height: max(10, height))
    }
}

#Preview {
    RopeView()
}
