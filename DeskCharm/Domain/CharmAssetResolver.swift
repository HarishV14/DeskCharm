//
//  CharmAssetResolver.swift
//  DeskCharm
//

import SwiftUI

/// Decouples charm domain models from SwiftUI artwork rendering,
/// mapping charm asset identifiers to transparent artwork views and dynamic glow colors.
enum CharmAssetResolver {
    /// Resolves a Charm to its transparent artwork view representation.
    @ViewBuilder
    static func view(for charm: Charm) -> some View {
        switch charm.assetIdentifier {
        case "charm_blue_eye":
            CharmView()
        case "charm_hamsa":
            HamsaCharmView()
        case "charm_drishti_bommai":
            DrishtiBommaiCharmView()
        case "charm_nimbu_mirchi":
            NimbuMirchiCharmView()
        case "charm_dream_catcher":
            DreamCatcherCharmView()
        case "charm_chinese_knot":
            ChineseKnotCharmView()
        case "charm_daruma":
            DarumaCharmView()
        case "charm_maneki_neko":
            ManekiNekoCharmView()
        case "charm_temple_bell":
            TempleBellCharmView()
        case "charm_lotus":
            LotusCharmView()
        case "charm_lucky_coin":
            LuckyCoinCharmView()
        case "charm_moon":
            CrescentMoonCharmView()
        case "charm_star":
            GoldenStarCharmView()
        case "charm_lemon":
            ProtectiveLemonCharmView()
        default:
            CharmView()
        }
    }
    
    /// Dynamic ambient glow color corresponding to the charm visual identity.
    static func glowColor(for charm: Charm) -> Color {
        switch charm.assetIdentifier {
        case "charm_blue_eye":
            return Color(red: 0.15, green: 0.50, blue: 0.95)
        case "charm_hamsa":
            return Color(red: 0.85, green: 0.65, blue: 0.25)
        case "charm_drishti_bommai", "charm_daruma", "charm_chinese_knot":
            return Color(red: 0.90, green: 0.20, blue: 0.15)
        case "charm_nimbu_mirchi", "charm_lemon":
            return Color(red: 0.75, green: 0.90, blue: 0.20)
        case "charm_dream_catcher":
            return Color(red: 0.25, green: 0.80, blue: 0.85)
        case "charm_maneki_neko":
            return Color(red: 0.95, green: 0.90, blue: 0.70)
        case "charm_temple_bell", "charm_lucky_coin", "charm_star", "charm_moon":
            return Color(red: 0.95, green: 0.78, blue: 0.22)
        case "charm_lotus":
            return Color(red: 0.95, green: 0.40, blue: 0.70)
        default:
            return Color.accentColor
        }
    }
}
