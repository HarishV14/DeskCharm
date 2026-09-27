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
        
        // Small fixed size suitable for a future hanging charm
        let width: CGFloat = 140
        let height: CGFloat = 180
        
        // Position window near the top-center of the primary macOS screen
        let screenFrame = NSScreen.main?.visibleFrame ?? NSRect(x: 0, y: 0, width: 800, height: 600)
        let originX = screenFrame.midX - (width / 2.0)
        let originY = screenFrame.maxY - height - 10.0
        
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
