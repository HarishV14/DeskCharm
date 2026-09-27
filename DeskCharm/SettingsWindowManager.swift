//
//  SettingsWindowManager.swift
//  DeskCharm
//

import AppKit
import SwiftUI

/// Manages the native macOS Settings window for DeskCharm.
final class SettingsWindowManager {
    static let shared = SettingsWindowManager()
    
    private var windowController: NSWindowController?
    
    private init() {}
    
    /// Presents or activates the single native DeskCharm Settings window.
    func showSettingsWindow() {
        if let existingWindow = windowController?.window {
            existingWindow.makeKeyAndOrderFront(nil)
            NSApp.activate(ignoringOtherApps: true)
            return
        }
        
        let settingsView = SettingsRootView()
        let hostingController = NSHostingController(rootView: settingsView)
        
        let window = NSWindow(contentViewController: hostingController)
        window.title = "DeskCharm Settings"
        window.styleMask = [.titled, .closable, .miniaturizable, .resizable]
        window.setContentSize(NSSize(width: 640, height: 420))
        window.minSize = NSSize(width: 550, height: 350)
        window.center()
        window.isReleasedWhenClosed = false
        
        let controller = NSWindowController(window: window)
        self.windowController = controller
        
        controller.showWindow(nil)
        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }
}
