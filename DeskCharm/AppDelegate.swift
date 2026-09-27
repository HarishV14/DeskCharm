//
//  AppDelegate.swift
//  DeskCharm
//

import AppKit

final class AppDelegate: NSObject, NSApplicationDelegate {
    private var statusBarController: StatusBarController?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Prevent the app from appearing as a normal window application in the Dock or window switcher
        NSApp.setActivationPolicy(.accessory)
        
        // Initialize the macOS menu bar status item controller
        statusBarController = StatusBarController()
        
        // Initialize and display the custom AppKit floating window anchored to the status bar icon
        CharmWindowManager.shared.setupAndShowWindow(anchorButton: statusBarController?.anchorButton)
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        // Clean up status bar item and close floating window on quit
        statusBarController?.remove()
        CharmWindowManager.shared.closeWindow()
    }
}
