//
//  ContentView.swift
//  DeskCharm
//
//  Created by Harish V on 27/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Simple vertical hanging rope
            Capsule()
                .fill(Color.primary.opacity(0.8))
                .frame(width: 2.5, height: 120)
            
            // Circular placeholder charm
            Circle()
                .fill(Color.indigo)
                .frame(width: 36, height: 36)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.clear)
    }
}

#Preview {
    ContentView()
}
