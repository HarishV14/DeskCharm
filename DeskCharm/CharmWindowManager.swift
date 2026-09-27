//
//  CharmWindowManager.swift
//  DeskCharm
//

import AppKit
import SwiftUI

/// Manages the custom borderless, transparent AppKit floating window for DeskCharm.
final class CharmWindowManager {
    static let shared = CharmWindowManager()
    
    private var window: NSWindow?
    
    private init() {}
    
    /// Creates, configures, positions, and presents the AppKit window.
    func setupAndShowWindow() {
        guard window == nil else { return }
        
        // Window dimensions providing ample room for pendulum sway and rope stretch
        let width: CGFloat = 500
        let height: CGFloat = 320
        
        // Position window near the top-center of the primary macOS screen frame
        guard let primaryScreen = NSScreen.main else { return }
        let screenFrame = primaryScreen.frame
        let originX = screenFrame.midX - (width / 2.0)
        let originY = screenFrame.maxY - height
        
        let contentRect = NSRect(x: originX, y: originY, width: width, height: height)
        
        // Create a borderless NSWindow
        let charmWindow = NSWindow(
            contentRect: contentRect,
            styleMask: [.borderless],
            backing: .buffered,
            defer: false
        )
        
        // Transparent window configuration
        charmWindow.backgroundColor = .clear
        charmWindow.isOpaque = false
        charmWindow.hasShadow = false
        
        // Window level and floating behaviors
        charmWindow.level = .floating
        charmWindow.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary, .stationary]
        charmWindow.isMovableByWindowBackground = false
        
        // Host the SwiftUI view hierarchy inside the AppKit window
        charmWindow.contentView = NSHostingView(rootView: ContentView())
        
        // Present the window
        charmWindow.makeKeyAndOrderFront(nil)
        charmWindow.orderFrontRegardless()
        
        self.window = charmWindow
    }
}
