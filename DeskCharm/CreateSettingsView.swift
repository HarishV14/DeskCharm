//
//  CreateSettingsView.swift
//  DeskCharm
//

import SwiftUI

/// View rendering the Create settings placeholder page.
struct CreateSettingsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Create")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Create a custom charm from your own image.")
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    CreateSettingsView()
}
