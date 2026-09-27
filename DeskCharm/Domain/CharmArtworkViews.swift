//
//  CharmArtworkViews.swift
//  DeskCharm
//

import SwiftUI

// MARK: - 1. Hamsa Protection Hand Charm
struct HamsaCharmView: View {
    var body: some View {
        ZStack {
            // Hand Base Shape
            HamsaHandShape()
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.95, green: 0.82, blue: 0.45), // Gold top
                            Color(red: 0.85, green: 0.65, blue: 0.25), // Bronze mid
                            Color(red: 0.65, green: 0.45, blue: 0.15)  // Deep gold base
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 3)
            
            // Inner Engraved Border
            HamsaHandShape()
                .stroke(Color(red: 0.45, green: 0.30, blue: 0.08), lineWidth: 1.5)
                .scaleEffect(0.9)
            
            // Central Protection Nazar Eye
            ZStack {
                Circle()
                    .fill(Color(red: 0.1, green: 0.4, blue: 0.85))
                    .frame(width: 22, height: 22)
                
                Circle()
                    .fill(Color(red: 0.5, green: 0.8, blue: 1.0))
                    .frame(width: 14, height: 14)
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 8, height: 8)
                
                Circle()
                    .fill(Color.black)
                    .frame(width: 4, height: 4)
            }
            .offset(y: 4)
        }
        .frame(width: 64, height: 72)
    }
}

private struct HamsaHandShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        
        path.move(to: CGPoint(x: w * 0.5, y: 0))
        path.addQuadCurve(to: CGPoint(x: w * 0.62, y: h * 0.08), control: CGPoint(x: w * 0.6, y: h * 0.01))
        path.addLine(to: CGPoint(x: w * 0.62, y: h * 0.18))
        path.addQuadCurve(to: CGPoint(x: w * 0.74, y: h * 0.25), control: CGPoint(x: w * 0.74, y: h * 0.18))
        path.addLine(to: CGPoint(x: w * 0.74, y: h * 0.42))
        path.addQuadCurve(to: CGPoint(x: w * 0.92, y: h * 0.55), control: CGPoint(x: w * 0.92, y: h * 0.44))
        path.addQuadCurve(to: CGPoint(x: w * 0.80, y: h * 0.68), control: CGPoint(x: w * 0.90, y: h * 0.66))
        path.addLine(to: CGPoint(x: w * 0.70, y: h * 0.90))
        path.addQuadCurve(to: CGPoint(x: w * 0.5, y: h * 0.98), control: CGPoint(x: w * 0.6, y: h * 0.98))
        path.addQuadCurve(to: CGPoint(x: w * 0.30, y: h * 0.90), control: CGPoint(x: w * 0.4, y: h * 0.98))
        path.addLine(to: CGPoint(x: w * 0.20, y: h * 0.68))
        path.addQuadCurve(to: CGPoint(x: w * 0.08, y: h * 0.55), control: CGPoint(x: w * 0.10, y: h * 0.66))
        path.addQuadCurve(to: CGPoint(x: w * 0.26, y: h * 0.42), control: CGPoint(x: w * 0.08, y: h * 0.44))
        path.addLine(to: CGPoint(x: w * 0.26, y: h * 0.25))
        path.addQuadCurve(to: CGPoint(x: w * 0.38, y: h * 0.18), control: CGPoint(x: w * 0.26, y: h * 0.18))
        path.addLine(to: CGPoint(x: w * 0.38, y: h * 0.08))
        path.addQuadCurve(to: CGPoint(x: w * 0.5, y: 0), control: CGPoint(x: w * 0.4, y: h * 0.01))
        
        return path
    }
}

// MARK: - 2. Drishti Bommai Mask Charm
struct DrishtiBommaiCharmView: View {
    var body: some View {
        ZStack {
            // Mask Main Head Contour
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.85, green: 0.15, blue: 0.10), // Vibrant red face
                            Color(red: 0.60, green: 0.05, blue: 0.05),
                            Color(red: 0.35, green: 0.02, blue: 0.02)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 3)
            
            // Golden Crown Top
            Path { path in
                path.move(to: CGPoint(x: 10, y: 12))
                path.addLine(to: CGPoint(x: 24, y: 2))
                path.addLine(to: CGPoint(x: 34, y: 14))
                path.addLine(to: CGPoint(x: 44, y: 2))
                path.addLine(to: CGPoint(x: 58, y: 12))
                path.closeSubpath()
            }
            .fill(
                LinearGradient(
                    colors: [Color(red: 1.0, green: 0.85, blue: 0.3), Color(red: 0.75, green: 0.5, blue: 0.1)],
                    startPoint: .top, endPoint: .bottom
                )
            )
            .offset(y: -24)
            
            // Protective Big Wide Eyes
            HStack(spacing: 8) {
                ZStack {
                    Ellipse().fill(Color.white).frame(width: 18, height: 14)
                    Circle().fill(Color.black).frame(width: 8, height: 8)
                    Circle().fill(Color.red).frame(width: 3, height: 3)
                }
                ZStack {
                    Ellipse().fill(Color.white).frame(width: 18, height: 14)
                    Circle().fill(Color.black).frame(width: 8, height: 8)
                    Circle().fill(Color.red).frame(width: 3, height: 3)
                }
            }
            .offset(y: -4)
            
            // Fierce Yellow/Gold Teeth / Mouth
            VStack(spacing: 2) {
                // Mustache
                Capsule()
                    .fill(Color.black)
                    .frame(width: 38, height: 6)
                
                // Teeth
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 26, height: 6)
                    .overlay(
                        HStack(spacing: 3) {
                            ForEach(0..<4) { _ in
                                Rectangle().fill(Color.black).frame(width: 1, height: 6)
                            }
                        }
                    )
            }
            .offset(y: 14)
            
            // Side Earrings
            HStack {
                Circle().fill(Color(red: 1.0, green: 0.8, blue: 0.2)).frame(width: 10, height: 10)
                Spacer()
                Circle().fill(Color(red: 1.0, green: 0.8, blue: 0.2)).frame(width: 10, height: 10)
            }
            .padding(.horizontal, -4)
        }
        .frame(width: 64, height: 72)
    }
}

// MARK: - 3. Nimbu-Mirchi Protection Charm
struct NimbuMirchiCharmView: View {
    var body: some View {
        VStack(spacing: -2) {
            // Hanging String Top
            Rectangle()
                .fill(Color.black.opacity(0.8))
                .frame(width: 1.5, height: 12)
            
            // Nimbu (Fresh Lemon)
            ZStack {
                Ellipse()
                    .fill(
                        RadialGradient(
                            colors: [Color(red: 1.0, green: 0.95, blue: 0.35), Color(red: 0.85, green: 0.8, blue: 0.1)],
                            center: UnitPoint(x: 0.4, y: 0.3), startRadius: 0, endRadius: 18
                        )
                    )
                    .frame(width: 28, height: 26)
                    .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 2)
                
                Circle()
                    .fill(Color.black)
                    .frame(width: 3, height: 3)
                    .offset(y: 11)
            }
            
            // 7 Green Mirchi (Chilies) Stacked
            VStack(spacing: -3) {
                ForEach(0..<5) { idx in
                    ChiliShape()
                        .fill(
                            LinearGradient(
                                colors: [Color(red: 0.25, green: 0.7, blue: 0.2), Color(red: 0.1, green: 0.45, blue: 0.1)],
                                startPoint: .top, endPoint: .bottom
                            )
                        )
                        .frame(width: 10, height: 16)
                        .rotationEffect(.degrees(Double(idx % 2 == 0 ? 8 : -8)))
                }
            }
            
            // Protective Black Thread Bead Bottom
            Circle()
                .fill(Color.black)
                .frame(width: 6, height: 6)
        }
        .frame(width: 48, height: 78)
    }
}

private struct ChiliShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        
        path.move(to: CGPoint(x: w * 0.5, y: 0))
        path.addQuadCurve(to: CGPoint(x: w * 0.7, y: h * 0.9), control: CGPoint(x: w * 1.1, y: h * 0.4))
        path.addQuadCurve(to: CGPoint(x: w * 0.5, y: 0), control: CGPoint(x: -w * 0.1, y: h * 0.4))
        return path
    }
}

// MARK: - 4. Dream Catcher Charm
struct DreamCatcherCharmView: View {
    var body: some View {
        VStack(spacing: 2) {
            // Main Web Hoop
            ZStack {
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [Color(red: 0.75, green: 0.55, blue: 0.35), Color(red: 0.45, green: 0.3, blue: 0.15)],
                            startPoint: .topLeading, endPoint: .bottomTrailing
                        ),
                        lineWidth: 4
                    )
                    .frame(width: 46, height: 46)
                    .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 2)
                
                // Web Lines
                ForEach(0..<8) { i in
                    Rectangle()
                        .fill(Color.white.opacity(0.4))
                        .frame(width: 1, height: 42)
                        .rotationEffect(.degrees(Double(i) * 22.5))
                }
                
                // Center Turquoise Gem Bead
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Color(red: 0.3, green: 0.85, blue: 0.8), Color(red: 0.1, green: 0.5, blue: 0.55)],
                            center: .center, startRadius: 0, endRadius: 5
                        )
                    )
                    .frame(width: 10, height: 10)
            }
            
            // Hanging Feathers & Strings
            HStack(spacing: 8) {
                FeatherView(color: Color(red: 0.95, green: 0.7, blue: 0.3))
                FeatherView(color: Color(red: 0.2, green: 0.75, blue: 0.85)).offset(y: 4)
                FeatherView(color: Color(red: 0.9, green: 0.4, blue: 0.5))
            }
        }
        .frame(width: 64, height: 78)
    }
}

private struct FeatherView: View {
    let color: Color
    var body: some View {
        VStack(spacing: 0) {
            Rectangle().fill(Color.black.opacity(0.5)).frame(width: 1, height: 6)
            LotusPetalShape()
                .fill(color)
                .frame(width: 10, height: 22)
        }
    }
}

// MARK: - 5. Chinese Silk Knot Charm
struct ChineseKnotCharmView: View {
    var body: some View {
        VStack(spacing: -2) {
            // Top Loop
            Circle()
                .stroke(Color(red: 0.85, green: 0.1, blue: 0.1), lineWidth: 2.5)
                .frame(width: 14, height: 14)
            
            // Main Red Silk Knot
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 0.85, green: 0.12, blue: 0.12))
                    .frame(width: 32, height: 32)
                    .rotationEffect(.degrees(45))
                    .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 2)
                
                // Green Jade Disk Center
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Color(red: 0.4, green: 0.85, blue: 0.5), Color(red: 0.15, green: 0.5, blue: 0.25)],
                            center: .center, startRadius: 0, endRadius: 8
                        )
                    )
                    .frame(width: 18, height: 18)
                    .overlay(
                        Circle().stroke(Color(red: 0.95, green: 0.8, blue: 0.3), lineWidth: 1)
                    )
            }
            
            // Lower Red Silk Fringe Tassel
            VStack(spacing: 1) {
                Rectangle().fill(Color(red: 0.95, green: 0.8, blue: 0.3)).frame(width: 10, height: 3)
                HStack(spacing: 1.5) {
                    ForEach(0..<6) { _ in
                        Rectangle().fill(Color(red: 0.85, green: 0.12, blue: 0.12)).frame(width: 1.5, height: 22)
                    }
                }
            }
        }
        .frame(width: 54, height: 76)
    }
}

// MARK: - 6. Daruma Doll Charm
struct DarumaCharmView: View {
    var body: some View {
        ZStack {
            // Round Red Body
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color(red: 0.90, green: 0.15, blue: 0.15),
                            Color(red: 0.70, green: 0.05, blue: 0.05),
                            Color(red: 0.45, green: 0.02, blue: 0.02)
                        ],
                        center: UnitPoint(x: 0.4, y: 0.3), startRadius: 0, endRadius: 32
                    )
                )
                .frame(width: 60, height: 60)
                .shadow(color: Color.black.opacity(0.35), radius: 4, x: 0, y: 3)
            
            // White Face Mask
            Circle()
                .fill(Color(red: 0.96, green: 0.94, blue: 0.88))
                .frame(width: 38, height: 34)
                .offset(y: -4)
            
            // Facial Features (Bold Black Eyes & Gold Whiskers)
            VStack(spacing: 2) {
                // Eyebrows / Whiskers
                HStack(spacing: 8) {
                    Rectangle().fill(Color.black).frame(width: 8, height: 2).rotationEffect(.degrees(15))
                    Rectangle().fill(Color.black).frame(width: 8, height: 2).rotationEffect(.degrees(-15))
                }
                
                // Black Pupil Eyes
                HStack(spacing: 10) {
                    Circle().fill(Color.black).frame(width: 8, height: 8)
                    Circle().fill(Color.black).frame(width: 8, height: 8)
                }
                
                // Moustache
                Capsule().fill(Color.black).frame(width: 14, height: 3)
            }
            .offset(y: -6)
            
            // Gold Belly Character Accent
            Text("福")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                .offset(y: 16)
        }
        .frame(width: 64, height: 64)
    }
}

// MARK: - 7. Maneki-neko Lucky Cat Charm
struct ManekiNekoCharmView: View {
    var body: some View {
        ZStack {
            // White Porcelain Cat Head & Paw
            VStack(spacing: 0) {
                ZStack {
                    // Head Body
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [Color.white, Color(red: 0.92, green: 0.92, blue: 0.95)],
                                center: UnitPoint(x: 0.3, y: 0.3), startRadius: 0, endRadius: 28
                            )
                        )
                        .frame(width: 52, height: 50)
                        .shadow(color: Color.black.opacity(0.25), radius: 3, x: 0, y: 2)
                    
                    // Pink Ears
                    HStack {
                        TriangleShape().fill(Color.pink.opacity(0.6)).frame(width: 10, height: 10).offset(x: -16, y: -20)
                        TriangleShape().fill(Color.pink.opacity(0.6)).frame(width: 10, height: 10).offset(x: 16, y: -20)
                    }
                    
                    // Cat Facial Features
                    VStack(spacing: 3) {
                        HStack(spacing: 12) {
                            Circle().fill(Color.black).frame(width: 5, height: 5)
                            Circle().fill(Color.black).frame(width: 5, height: 5)
                        }
                        Circle().fill(Color.pink).frame(width: 4, height: 3)
                        
                        // Whiskers
                        HStack(spacing: 20) {
                            Rectangle().fill(Color.black).frame(width: 6, height: 1)
                            Rectangle().fill(Color.black).frame(width: 6, height: 1)
                        }
                    }
                    .offset(y: -2)
                }
                
                // Red Collar with Gold Bell
                ZStack {
                    Capsule().fill(Color.red).frame(width: 36, height: 6)
                    Circle().fill(Color(red: 1.0, green: 0.85, blue: 0.3)).frame(width: 10, height: 10)
                }
                .offset(y: -6)
            }
            
            // Raised Beckoning Paw Right
            Capsule()
                .fill(Color.white)
                .frame(width: 12, height: 22)
                .rotationEffect(.degrees(-25))
                .offset(x: 22, y: -8)
        }
        .frame(width: 62, height: 64)
    }
}

private struct TriangleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.width / 2, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        return path
    }
}

// MARK: - 8. Sacred Temple Bell Charm
struct TempleBellCharmView: View {
    var body: some View {
        VStack(spacing: 0) {
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [Color(red: 0.95, green: 0.8, blue: 0.3), Color(red: 0.6, green: 0.4, blue: 0.1)],
                        startPoint: .top, endPoint: .bottom
                    ),
                    lineWidth: 3.5
                )
                .frame(width: 16, height: 16)
                .offset(y: 4)
            
            ZStack(alignment: .bottom) {
                TempleBellShape()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.98, green: 0.85, blue: 0.4),
                                Color(red: 0.88, green: 0.68, blue: 0.25),
                                Color(red: 0.65, green: 0.45, blue: 0.12)
                            ],
                            startPoint: .top, endPoint: .bottom
                        )
                    )
                    .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 3)
                
                TempleBellShape()
                    .fill(
                        LinearGradient(
                            colors: [Color.white.opacity(0.4), Color.clear],
                            startPoint: .leading, endPoint: .trailing
                        )
                    )
                    .mask(Rectangle().frame(width: 14).offset(x: -12))
                
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color(red: 0.5, green: 0.32, blue: 0.08))
                    .frame(width: 58, height: 6)
                    .offset(y: -4)
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Color(red: 0.95, green: 0.8, blue: 0.3), Color(red: 0.4, green: 0.25, blue: 0.05)],
                            center: .center, startRadius: 0, endRadius: 6
                        )
                    )
                    .frame(width: 12, height: 12)
                    .offset(y: 6)
            }
            .frame(width: 60, height: 52)
        }
        .frame(width: 64, height: 74)
    }
}

private struct TempleBellShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        
        path.move(to: CGPoint(x: w * 0.3, y: 0))
        path.addQuadCurve(to: CGPoint(x: w * 0.7, y: 0), control: CGPoint(x: w * 0.5, y: -h * 0.05))
        path.addCurve(
            to: CGPoint(x: w * 0.95, y: h * 0.85),
            control1: CGPoint(x: w * 0.8, y: h * 0.2),
            control2: CGPoint(x: w * 0.95, y: h * 0.5)
        )
        path.addLine(to: CGPoint(x: w * 0.05, y: h * 0.85))
        path.addCurve(
            to: CGPoint(x: w * 0.3, y: 0),
            control1: CGPoint(x: w * 0.05, y: h * 0.5),
            control2: CGPoint(x: w * 0.2, y: h * 0.2)
        )
        path.closeSubpath()
        return path
    }
}

// MARK: - 9. Sacred Lotus Charm
struct LotusCharmView: View {
    var body: some View {
        ZStack {
            ForEach(0..<5) { index in
                LotusPetalShape()
                    .fill(
                        LinearGradient(
                            colors: [Color(red: 0.9, green: 0.35, blue: 0.65), Color(red: 0.65, green: 0.15, blue: 0.45)],
                            startPoint: .top, endPoint: .bottom
                        )
                    )
                    .frame(width: 24, height: 46)
                    .rotationEffect(.degrees(Double(index - 2) * 28))
                    .offset(y: -4)
            }
            
            ForEach(0..<3) { index in
                LotusPetalShape()
                    .fill(
                        LinearGradient(
                            colors: [Color(red: 1.0, green: 0.6, blue: 0.85), Color(red: 0.85, green: 0.25, blue: 0.55)],
                            startPoint: .top, endPoint: .bottom
                        )
                    )
                    .frame(width: 22, height: 40)
                    .rotationEffect(.degrees(Double(index - 1) * 22))
                    .offset(y: 2)
            }
            
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(red: 1.0, green: 0.9, blue: 0.4), Color(red: 0.9, green: 0.6, blue: 0.1)],
                        center: .center, startRadius: 0, endRadius: 10
                    )
                )
                .frame(width: 16, height: 16)
                .offset(y: 12)
        }
        .frame(width: 68, height: 68)
        .shadow(color: Color(red: 0.8, green: 0.2, blue: 0.5).opacity(0.3), radius: 4, x: 0, y: 3)
    }
}

private struct LotusPetalShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        
        path.move(to: CGPoint(x: w * 0.5, y: 0))
        path.addQuadCurve(to: CGPoint(x: w * 0.5, y: h), control: CGPoint(x: w * 1.0, y: h * 0.4))
        path.addQuadCurve(to: CGPoint(x: w * 0.5, y: 0), control: CGPoint(x: 0, y: h * 0.4))
        return path
    }
}

// MARK: - 10. Golden Lucky Coin Charm
struct LuckyCoinCharmView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color(red: 1.0, green: 0.88, blue: 0.45),
                            Color(red: 0.88, green: 0.68, blue: 0.22),
                            Color(red: 0.62, green: 0.42, blue: 0.08)
                        ],
                        center: UnitPoint(x: 0.4, y: 0.4), startRadius: 0, endRadius: 34
                    )
                )
                .shadow(color: Color.black.opacity(0.35), radius: 4, x: 0, y: 3)
            
            Circle()
                .stroke(Color(red: 0.5, green: 0.32, blue: 0.05), lineWidth: 2)
                .frame(width: 58, height: 58)
            
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [Color(red: 0.35, green: 0.22, blue: 0.05), Color(red: 0.15, green: 0.08, blue: 0.02)],
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
                .frame(width: 18, height: 18)
                .overlay(
                    Rectangle().stroke(Color(red: 0.95, green: 0.8, blue: 0.3), lineWidth: 1.5)
                )
            
            Ellipse()
                .fill(Color.white.opacity(0.35))
                .frame(width: 32, height: 14)
                .rotationEffect(.degrees(-35))
                .offset(x: -12, y: -16)
        }
        .frame(width: 66, height: 66)
    }
}

// MARK: - 11. Celestial Crescent Moon Charm
struct CrescentMoonCharmView: View {
    var body: some View {
        ZStack {
            CrescentShape()
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 1.0, green: 0.9, blue: 0.5),
                            Color(red: 0.85, green: 0.68, blue: 0.25),
                            Color(red: 0.6, green: 0.45, blue: 0.12)
                        ],
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
                .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 3)
            
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: 48, y: 18))
                    path.addLine(to: CGPoint(x: 48, y: 32))
                }
                .stroke(Color(red: 0.8, green: 0.65, blue: 0.2), lineWidth: 1)
                
                GoldenStarShape()
                    .fill(Color(red: 1.0, green: 0.85, blue: 0.3))
                    .frame(width: 16, height: 16)
                    .offset(x: 16, y: 2)
            }
        }
        .frame(width: 64, height: 68)
    }
}

private struct CrescentShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        
        path.addArc(center: CGPoint(x: w * 0.5, y: h * 0.5), radius: w * 0.45, startAngle: .degrees(-110), endAngle: .degrees(130), clockwise: false)
        path.addArc(center: CGPoint(x: w * 0.65, y: h * 0.42), radius: w * 0.38, startAngle: .degrees(130), endAngle: .degrees(-110), clockwise: true)
        path.closeSubpath()
        return path
    }
}

// MARK: - 12. Golden Star Charm
struct GoldenStarCharmView: View {
    var body: some View {
        ZStack {
            GoldenStarShape()
                .fill(
                    RadialGradient(
                        colors: [
                            Color(red: 1.0, green: 0.95, blue: 0.6),
                            Color(red: 0.95, green: 0.75, blue: 0.2),
                            Color(red: 0.7, green: 0.48, blue: 0.08)
                        ],
                        center: .center, startRadius: 0, endRadius: 32
                    )
                )
                .shadow(color: Color(red: 0.9, green: 0.7, blue: 0.2).opacity(0.4), radius: 5, x: 0, y: 3)
            
            Circle()
                .fill(Color.white.opacity(0.6))
                .frame(width: 10, height: 10)
                .blur(radius: 2)
        }
        .frame(width: 64, height: 64)
    }
}

private struct GoldenStarShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let rOuter = rect.width / 2
        let rInner = rOuter * 0.4
        
        let points = 5
        let angleStep = Double.pi / Double(points)
        var angle = -Double.pi / 2
        
        path.move(to: CGPoint(x: center.x + rOuter * CGFloat(Darwin.cos(angle)), y: center.y + rOuter * CGFloat(Darwin.sin(angle))))
        
        for _ in 0..<points {
            angle += angleStep
            path.addLine(to: CGPoint(x: center.x + rInner * CGFloat(Darwin.cos(angle)), y: center.y + rInner * CGFloat(Darwin.sin(angle))))
            angle += angleStep
            path.addLine(to: CGPoint(x: center.x + rOuter * CGFloat(Darwin.cos(angle)), y: center.y + rOuter * CGFloat(Darwin.sin(angle))))
        }
        path.closeSubpath()
        return path
    }
}

// MARK: - 13. Protective Lemon Charm
struct ProtectiveLemonCharmView: View {
    var body: some View {
        VStack(spacing: -6) {
            Rectangle()
                .fill(Color.black.opacity(0.6))
                .frame(width: 1.5, height: 12)
            
            ZStack(alignment: .topTrailing) {
                Ellipse()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(red: 0.98, green: 0.95, blue: 0.35),
                                Color(red: 0.88, green: 0.85, blue: 0.15),
                                Color(red: 0.6, green: 0.65, blue: 0.08)
                            ],
                            center: UnitPoint(x: 0.4, y: 0.3), startRadius: 0, endRadius: 30
                        )
                    )
                    .frame(width: 50, height: 60)
                    .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 3)
                
                LotusPetalShape()
                    .fill(
                        LinearGradient(
                            colors: [Color(red: 0.3, green: 0.75, blue: 0.2), Color(red: 0.1, green: 0.45, blue: 0.1)],
                            startPoint: .top, endPoint: .bottom
                        )
                    )
                    .frame(width: 16, height: 26)
                    .rotationEffect(.degrees(35))
                    .offset(x: 6, y: -4)
            }
        }
        .frame(width: 60, height: 72)
    }
}
