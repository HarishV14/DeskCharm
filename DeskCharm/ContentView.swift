//
//  ContentView.swift
//  DeskCharm
//

import SwiftUI

struct ContentView: View {
    @State private var pendulum = PendulumPhysics()
    @State private var isSimulating = false
    @State private var isDragging = false
    
    // Drag tracking state
    @State private var initialPivotX: Double = 0.0
    @State private var initialPivotY: Double = 0.0
    @State private var lastDragAngle: Double = 0.0
    @State private var lastDragStretch: Double = 0.0
    @State private var lastDragTime: Date = Date()
    @State private var dragAngularVel: Double = 0.0
    @State private var dragStretchVel: Double = 0.0
    
    var body: some View {
        ZStack(alignment: .top) {
            // Transparent background allowing mouse clicks outside the charm to pass through to desktop/apps
            Color.clear
            
            // Hanging rope + charm assembly rotated around top fixed pivot point
            VStack(spacing: 0) {
                RopeView(width: 2.5, height: pendulum.currentRopeHeight)
                
                CharmView()
                    .gesture(
                        DragGesture(minimumDistance: 0, coordinateSpace: .global)
                            .onChanged { value in
                                handleDragChanged(value)
                            }
                            .onEnded { value in
                                handleDragEnded(value)
                            }
                    )
            }
            .rotationEffect(.radians(-pendulum.angle), anchor: .top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.clear)
    }
    
    private func handleDragChanged(_ value: DragGesture.Value) {
        let now = Date()
        if !isDragging {
            isDragging = true
            isSimulating = false
            
            let startL = pendulum.effectiveLength
            initialPivotX = startL * sin(pendulum.angle)
            initialPivotY = startL * cos(pendulum.angle)
            
            lastDragAngle = pendulum.angle
            lastDragStretch = pendulum.stretch
            lastDragTime = now
            dragAngularVel = 0.0
            dragStretchVel = 0.0
        }
        
        let targetX = initialPivotX + value.translation.width
        let targetY = max(30.0, initialPivotY + value.translation.height)
        
        // Compute angle from horizontal displacement relative to base rope length
        let rawRatio = targetX / pendulum.baseRopeLength
        let clampedRatio = max(-sin(pendulum.maxAngle), min(sin(pendulum.maxAngle), rawRatio))
        let newAngle = asin(clampedRatio)
        
        // Compute stretch from 2D displacement relative to rest distance
        let currentDist = sqrt(targetX * targetX + targetY * targetY)
        let restDist = pendulum.baseRopeLength + pendulum.charmRadius
        let newStretch = max(pendulum.minStretch, min(pendulum.maxStretch, currentDist - restDist))
        
        let dt = now.timeIntervalSince(lastDragTime)
        if dt > 0.005 && dt < 0.2 {
            let instantAngularVel = (newAngle - lastDragAngle) / dt
            dragAngularVel = dragAngularVel * 0.4 + instantAngularVel * 0.6
            
            let instantStretchVel = (newStretch - lastDragStretch) / dt
            dragStretchVel = dragStretchVel * 0.4 + instantStretchVel * 0.6
        }
        
        lastDragAngle = newAngle
        lastDragStretch = newStretch
        lastDragTime = now
        
        pendulum.angle = newAngle
        pendulum.stretch = newStretch
    }
    
    private func handleDragEnded(_ value: DragGesture.Value) {
        let now = Date()
        let timeSinceLastUpdate = now.timeIntervalSince(lastDragTime)
        
        if timeSinceLastUpdate > 0.1 {
            dragAngularVel = 0.0
            dragStretchVel = 0.0
        }
        
        pendulum.angle = lastDragAngle
        pendulum.angularVelocity = max(-8.0, min(8.0, dragAngularVel))
        
        pendulum.stretch = lastDragStretch
        pendulum.stretchVelocity = max(-600.0, min(600.0, dragStretchVel))
        
        isDragging = false
        startPhysicsLoop()
    }
    
    private func startPhysicsLoop() {
        guard !isSimulating else { return }
        isSimulating = true
        
        Task { @MainActor in
            var lastTime = Date()
            while isSimulating && !isDragging {
                try? await Task.sleep(nanoseconds: 16_666_667)
                guard isSimulating && !isDragging else { break }
                
                let now = Date()
                let dt = now.timeIntervalSince(lastTime)
                lastTime = now
                
                pendulum.step(deltaTime: dt)
                
                if pendulum.isResting {
                    pendulum.resetToRest()
                    isSimulating = false
                    break
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
