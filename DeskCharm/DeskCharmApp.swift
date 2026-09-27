//
//  DeskCharmApp.swift
//  DeskCharm
//
//  Created by Harish V on 27/09/26.
//

import SwiftUI

@main
struct DeskCharmApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}
