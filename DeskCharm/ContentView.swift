//
//  ContentView.swift
//  DeskCharm
//
//  Created by Harish V on 27/09/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "sparkles")
                .font(.system(size: 28))
                .foregroundStyle(.tint)
            Text("DeskCharm")
                .font(.caption)
                .fontWeight(.medium)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear)
    }
}

#Preview {
    ContentView()
}
