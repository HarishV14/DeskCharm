//
//  CharmIconGenerator.swift
//  DeskCharm
//

import AppKit

/// Generates the DeskCharm brand menu bar status icon.
enum CharmIconGenerator {
    /// Creates an 18x18 template NSImage of the official DeskCharm brand logo mark.
    static func createStatusBarIcon() -> NSImage {
        let size = NSSize(width: 18, height: 18)
        let image = NSImage(size: size, flipped: false) { rect in
            NSColor.black.setStroke()
            NSColor.black.setFill()
            
            // 1. Top ring / bail
            let ringPath = NSBezierPath()
            ringPath.appendArc(withCenter: NSPoint(x: 9.0, y: 15.5), radius: 1.8, startAngle: 0, endAngle: 360)
            ringPath.lineWidth = 1.0
            ringPath.stroke()
            
            // 2. Hanging cord
            let cordPath = NSBezierPath()
            cordPath.move(to: NSPoint(x: 9.0, y: 13.7))
            cordPath.line(to: NSPoint(x: 9.0, y: 11.5))
            cordPath.lineWidth = 1.2
            cordPath.stroke()
            
            // 3. Diamond Charm Mark Body
            let diamondPath = NSBezierPath()
            let center = NSPoint(x: 9.0, y: 6.5)
            let h: CGFloat = 4.5
            diamondPath.move(to: NSPoint(x: center.x, y: center.y + h))
            diamondPath.line(to: NSPoint(x: center.x + h, y: center.y))
            diamondPath.line(to: NSPoint(x: center.x, y: center.y - h))
            diamondPath.line(to: NSPoint(x: center.x - h, y: center.y))
            diamondPath.close()
            diamondPath.lineWidth = 1.3
            diamondPath.stroke()
            
            // 4. Center Core Dot
            let corePath = NSBezierPath()
            corePath.appendArc(withCenter: center, radius: 1.2, startAngle: 0, endAngle: 360)
            corePath.fill()
            
            return true
        }
        image.isTemplate = true
        return image
    }
}
