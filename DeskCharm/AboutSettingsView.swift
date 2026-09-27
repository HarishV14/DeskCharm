//
//  AboutSettingsView.swift
//  DeskCharm
//

import SwiftUI

/// View rendering the About page for DeskCharm.
struct AboutSettingsView: View {
    var body: some View {
        VStack(spacing: 16) {
            DeskCharmBrandLogo()
                .frame(width: 84, height: 84)
            
            Text(BrandTokens.brandName)
                .font(.system(size: 26, weight: .bold, design: .rounded))
            
            Text(BrandTokens.versionString)
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text(BrandTokens.tagline)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            VStack(spacing: 4) {
                Text("Developed by \(BrandTokens.developerName)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(BrandTokens.copyrightNotice)
                    .font(.caption2)
                    .foregroundColor(.secondary.opacity(0.7))
            }
            .padding(.top, 16)
            
            Spacer()
        }
        .padding(32)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    AboutSettingsView()
}
