//
//  PendulumPhysics.swift
//  DeskCharm
//

import Foundation

/// Physics model for a 2D damped elastic pendulum (sway + rope stretch bounce).
struct PendulumPhysics {
    // MARK: - Angular Physics (Sway)
    /// Angular position in radians. 0 is vertical hanging down. Positive is right, negative is left.
    var angle: Double = 0.0
    
    /// Angular velocity in radians per second.
    var angularVelocity: Double = 0.0
    
    /// Acceleration due to gravity (in points/s²).
    var gravity: Double = 1600.0
    
    /// Base rest length of the rope (in points).
    var baseRopeLength: Double = 120.0
    
    /// Charm radius (in points).
    var charmRadius: Double = 36.0
    
    /// Angular damping coefficient (air resistance/friction).
    var angularDamping: Double = 1.6
    
    /// Maximum allowed swing angle in radians (~60 degrees).
    let maxAngle: Double = .pi / 3.0
    
    // MARK: - Radial Physics (Elastic Stretch / Bounce)
    /// Vertical/radial extension beyond rest length (in points). Positive = stretched down.
    var stretch: Double = 0.0
    
    /// Rate of stretch change (in points per second).
    var stretchVelocity: Double = 0.0
    
    /// Elastic spring stiffness for rope stretching (in s⁻²).
    var springStiffness: Double = 350.0
    
    /// Damping coefficient for rope stretch bouncing (in s⁻¹).
    var springDamping: Double = 5.0
    
    /// Maximum allowed stretch extension (in points).
    let maxStretch: Double = 75.0
    
    /// Maximum allowed stretch compression (in points).
    let minStretch: Double = -10.0
    
    /// Total effective pendulum length from pivot to charm center.
    var effectiveLength: Double {
        return max(30.0, baseRopeLength + stretch + charmRadius)
    }
    
    /// Current visual rope height.
    var currentRopeHeight: CGFloat {
        return CGFloat(max(10.0, baseRopeLength + stretch))
    }
    
    /// Advances the elastic pendulum simulation state by `deltaTime` seconds.
    mutating func step(deltaTime dt: Double) {
        guard dt > 0 else { return }
        
        // Clamp frame delta time to prevent physics explosions on lag spikes
        let safeDt = min(dt, 0.033)
        
        // Sub-step numerical integration (4 sub-steps per frame)
        let steps = 4
        let subDt = safeDt / Double(steps)
        
        for _ in 0..<steps {
            let L = effectiveLength
            
            // 1. Angular dynamics (sway)
            let angularAccel = -(gravity / L) * sin(angle) - angularDamping * angularVelocity
            angularVelocity += angularAccel * subDt
            angle += angularVelocity * subDt
            
            // Enforce hard boundary angular limits
            if angle > maxAngle {
                angle = maxAngle
                angularVelocity = min(0.0, angularVelocity)
            } else if angle < -maxAngle {
                angle = -maxAngle
                angularVelocity = max(0.0, angularVelocity)
            }
            
            // 2. Radial dynamics (spring stretch / bounce)
            // Centripetal acceleration + spring restoring force + damping force
            let stretchAccel = -springStiffness * stretch - springDamping * stretchVelocity + L * (angularVelocity * angularVelocity) * 0.1
            stretchVelocity += stretchAccel * subDt
            stretch += stretchVelocity * subDt
            
            // Enforce hard stretch limits
            if stretch > maxStretch {
                stretch = maxStretch
                stretchVelocity = min(0.0, stretchVelocity)
            } else if stretch < minStretch {
                stretch = minStretch
                stretchVelocity = max(0.0, stretchVelocity)
            }
        }
    }
    
    /// Determines whether the elastic pendulum has naturally come to rest.
    var isResting: Bool {
        return abs(angle) < 0.002 &&
               abs(angularVelocity) < 0.005 &&
               abs(stretch) < 0.5 &&
               abs(stretchVelocity) < 1.0
    }
    
    /// Resets physics state to vertical resting position.
    mutating func resetToRest() {
        angle = 0.0
        angularVelocity = 0.0
        stretch = 0.0
        stretchVelocity = 0.0
    }
}
