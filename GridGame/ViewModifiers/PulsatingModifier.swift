//
//  PulsatingModifier.swift
//  GridGame
//
//  Created by Jason Vance on 5/27/25.
//

import SwiftUI

struct PulsatingModifier: ViewModifier {
    @State private var animate = false

    func body(content: Content) -> some View {
        content
            .scaleEffect(animate ? 0.95 : 1.0)
            .opacity(animate ? 0.25 : 0.5)
            .animation(
                Animation.easeInOut(duration: 0.8)
                    .repeatForever(autoreverses: true),
                value: animate
            )
            .onAppear {
                animate = true
            }
    }
}

extension View {
    func pulsatingEffect() -> some View {
        self.modifier(PulsatingModifier())
    }
}
