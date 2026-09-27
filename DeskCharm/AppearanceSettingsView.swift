//
//  AppearanceSettingsView.swift
//  DeskCharm
//

import SwiftUI

/// View rendering the Appearance settings placeholder page.
struct AppearanceSettingsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Appearance")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Charm and rope customization will appear here.")
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    AppearanceSettingsView()
}
