//
//  LibrarySettingsView.swift
//  DeskCharm
//

import SwiftUI

/// View rendering the Library settings placeholder page.
struct LibrarySettingsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Library")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Your installed and available charms will appear here.")
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    LibrarySettingsView()
}
