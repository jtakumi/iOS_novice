//
//  LiquidGlassEffect.swift
//  iOS_novice
//
//  Created for iOS 18 Liquid Glass Effect
//

import SwiftUI

// iOS 18のLiquid Glassエフェクト
@available(iOS 18.0, *)
struct LiquidGlassEffect: ViewModifier {
    let cornerRadius: CGFloat
    let intensity: Double
    let tintColor: Color?
    
    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.regularMaterial)
                    .overlay {
                        if let tintColor = tintColor {
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .fill(tintColor.opacity(0.1))
                        }
                    }
                    .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
            }
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

// iOS 18未満の場合のフォールバック
struct LegacyGlassEffect: ViewModifier {
    let cornerRadius: CGFloat
    let intensity: Double
    let tintColor: Color?
    
    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.ultraThinMaterial)
                    .overlay {
                        if let tintColor = tintColor {
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .fill(tintColor.opacity(0.1))
                        }
                    }
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
            }
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

// 拡張メソッド
extension View {
    func liquidGlass(
        cornerRadius: CGFloat = 16,
        intensity: Double = 0.8,
        tintColor: Color? = nil
    ) -> some View {
        Group {
            if #available(iOS 18.0, *) {
                self.modifier(LiquidGlassEffect(
                    cornerRadius: cornerRadius,
                    intensity: intensity,
                    tintColor: tintColor
                ))
            } else {
                self.modifier(LegacyGlassEffect(
                    cornerRadius: cornerRadius,
                    intensity: intensity,
                    tintColor: tintColor
                ))
            }
        }
    }
}