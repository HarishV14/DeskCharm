//
//  GeneralSettingsView.swift
//  DeskCharm
//

import SwiftUI

/// View rendering the General settings placeholder page.
struct GeneralSettingsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("General")
                .font(.title)
                .fontWeight(.bold)
            
            Text("DeskCharm preferences will appear here.")
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    GeneralSettingsView()
}
