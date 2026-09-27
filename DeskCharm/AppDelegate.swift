//
//  AppDelegate.swift
//  DeskCharm
//

import AppKit

final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Prevent the app from appearing as a normal window application in the Dock or window switcher
        NSApp.setActivationPolicy(.accessory)
        
        // Initialize and display the custom AppKit window
        CharmWindowManager.shared.setupAndShowWindow()
    }
}
