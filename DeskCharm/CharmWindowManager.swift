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
    
    /// Indicates whether the floating charm window is currently visible on screen.
    var isCharmVisible: Bool {
        return window?.isVisible ?? false
    }
    
    private init() {}
    
    /// Calculates window origin relative to the status bar button's screen position.
    private func calculateWindowFrame(for width: CGFloat, height: CGFloat, anchorButton: NSStatusBarButton?) -> NSRect {
        var buttonMidX: CGFloat
        var buttonMinY: CGFloat
        
        if let button = anchorButton, let buttonWindow = button.window {
            let rectInWindow = button.convert(button.bounds, to: nil)
            let buttonScreenFrame = buttonWindow.convertToScreen(rectInWindow)
            buttonMidX = buttonScreenFrame.midX
            buttonMinY = buttonScreenFrame.minY
        } else if let primaryScreen = NSScreen.main {
            // Fallback to primary screen top-center if status bar frame is not ready
            let screenFrame = primaryScreen.frame
            buttonMidX = screenFrame.midX
            buttonMinY = screenFrame.maxY
        } else {
            buttonMidX = 500
            buttonMinY = 800
        }
        
        let originX = buttonMidX - (width / 2.0)
        let originY = buttonMinY - height
        
        return NSRect(x: originX, y: originY, width: width, height: height)
    }
    
    /// Creates, configures, positions, and presents the AppKit window anchored to the status bar button.
    func setupAndShowWindow(anchorButton: NSStatusBarButton? = nil) {
        let width: CGFloat = 500
        let height: CGFloat = 320
        let contentRect = calculateWindowFrame(for: width, height: height, anchorButton: anchorButton)
        
        if let existingWindow = window {
            existingWindow.setFrameOrigin(contentRect.origin)
            showCharm(anchorButton: anchorButton)
            return
        }
        
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
    
    /// Shows the floating charm window, updating its position relative to the status bar button.
    func showCharm(anchorButton: NSStatusBarButton? = nil) {
        guard let window = window else {
            setupAndShowWindow(anchorButton: anchorButton)
            return
        }
        
        if let button = anchorButton, let buttonWindow = button.window {
            let rectInWindow = button.convert(button.bounds, to: nil)
            let buttonScreenFrame = buttonWindow.convertToScreen(rectInWindow)
            let originX = buttonScreenFrame.midX - (window.frame.width / 2.0)
            let originY = buttonScreenFrame.minY - window.frame.height
            window.setFrameOrigin(NSPoint(x: originX, y: originY))
        }
        
        window.makeKeyAndOrderFront(nil)
        window.orderFrontRegardless()
        window.setIsVisible(true)
    }
    
    /// Hides the floating charm window without destroying it.
    func hideCharm() {
        window?.orderOut(nil)
        window?.setIsVisible(false)
    }
    
    /// Closes and releases the floating charm window.
    func closeWindow() {
        window?.close()
        window = nil
    }
}
