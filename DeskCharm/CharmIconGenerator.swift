//
//  CharmIconGenerator.swift
//  DeskCharm
//

import AppKit

/// Generates the custom DeskCharm status bar icon.
enum CharmIconGenerator {
    /// Creates an 18x18 template NSImage of the custom DeskCharm lucky-bead symbol.
    static func createStatusBarIcon() -> NSImage {
        let size = NSSize(width: 18, height: 18)
        let image = NSImage(size: size, flipped: false) { rect in
            NSColor.black.setStroke()
            NSColor.black.setFill()
            
            // 1. Top hanging stem
            let stemPath = NSBezierPath()
            stemPath.move(to: NSPoint(x: 9.0, y: 17.0))
            stemPath.line(to: NSPoint(x: 9.0, y: 13.5))
            stemPath.lineWidth = 1.5
            stemPath.stroke()
            
            // 2. Outer bead ring
            let outerCenter = NSPoint(x: 9.0, y: 7.5)
            let outerRadius: CGFloat = 5.5
            let outerPath = NSBezierPath()
            outerPath.appendArc(withCenter: outerCenter, radius: outerRadius, startAngle: 0, endAngle: 360)
            outerPath.lineWidth = 1.3
            outerPath.stroke()
            
            // 3. Inner iris ring
            let innerRadius: CGFloat = 3.2
            let innerPath = NSBezierPath()
            innerPath.appendArc(withCenter: outerCenter, radius: innerRadius, startAngle: 0, endAngle: 360)
            innerPath.lineWidth = 1.0
            innerPath.stroke()
            
            // 4. Center pupil dot
            let pupilRadius: CGFloat = 1.3
            let pupilPath = NSBezierPath()
            pupilPath.appendArc(withCenter: outerCenter, radius: pupilRadius, startAngle: 0, endAngle: 360)
            pupilPath.fill()
            
            return true
        }
        image.isTemplate = true
        return image
    }
}
