//
//  StatusBarController.swift
//  DeskCharm
//

import AppKit

/// Manages the macOS menu-bar NSStatusItem and native NSMenu for DeskCharm.
final class StatusBarController: NSObject, NSMenuDelegate {
    private var statusItem: NSStatusItem
    private var menu: NSMenu
    private var showItem: NSMenuItem
    private var hideItem: NSMenuItem
    private var quitItem: NSMenuItem
    
    /// Returns the NSStatusBarButton instance associated with this status item.
    var anchorButton: NSStatusBarButton? {
        return statusItem.button
    }
    
    override init() {
        // Create a variable length status bar item
        self.statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        self.menu = NSMenu(title: "DeskCharm")
        
        // Create menu items
        self.showItem = NSMenuItem(title: "Show Charm", action: #selector(showCharmClicked), keyEquivalent: "")
        self.hideItem = NSMenuItem(title: "Hide Charm", action: #selector(hideCharmClicked), keyEquivalent: "")
        self.quitItem = NSMenuItem(title: "Quit DeskCharm", action: #selector(quitClicked), keyEquivalent: "")
        
        super.init()
        
        setupStatusBarItem()
        setupMenu()
    }
    
    private func setupStatusBarItem() {
        if let button = statusItem.button {
            // Use custom DeskCharm template icon for auto light/dark menu bar adaptation
            button.image = CharmIconGenerator.createStatusBarIcon()
            button.toolTip = "DeskCharm"
        }
    }
    
    private func setupMenu() {
        showItem.target = self
        hideItem.target = self
        quitItem.target = self
        
        menu.addItem(showItem)
        menu.addItem(hideItem)
        menu.addItem(NSMenuItem.separator())
        menu.addItem(quitItem)
        
        menu.delegate = self
        statusItem.menu = menu
    }
    
    // MARK: - NSMenuDelegate
    
    func menuWillOpen(_ menu: NSMenu) {
        let isVisible = CharmWindowManager.shared.isCharmVisible
        showItem.isEnabled = !isVisible
        hideItem.isEnabled = isVisible
    }
    
    // MARK: - Menu Actions
    
    @objc private func showCharmClicked() {
        CharmWindowManager.shared.showCharm(anchorButton: statusItem.button)
    }
    
    @objc private func hideCharmClicked() {
        CharmWindowManager.shared.hideCharm()
    }
    
    @objc private func quitClicked() {
        NSApp.terminate(nil)
    }
    
    /// Removes the status item from the macOS menu bar.
    func remove() {
        NSStatusBar.system.removeStatusItem(statusItem)
    }
}
