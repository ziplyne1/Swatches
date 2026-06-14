//
//  SwatchModifier.swift
//  Swatches
//
//  Created by Pax Willoughby on 6/13/26.
//

import Foundation
import SwiftUI

struct SwatchModifier: ViewModifier {
    var swatch: Swatch
    
    @Environment(\.colorScheme) private var environmentColorScheme
    @State private var manualColorScheme: ColorScheme? = nil
    private var appearanceSymbol: String {
        manualColorScheme == .light
        ? "moon.fill" : "sun.max.fill"
    }
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(swatch.name)
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(manualColorScheme ?? environmentColorScheme)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        "Toggle Appearance",
                        systemImage: appearanceSymbol
                    ) { toggleAppearance() }
                }
            }
    }
    
    
    private func toggleAppearance() {
        if manualColorScheme == nil {
            manualColorScheme = (environmentColorScheme == .light) ? .dark : .light
        } else {
            manualColorScheme = (manualColorScheme == .light) ? .dark : .light
        }
    }
}

extension View {
    func swatchModifier(for swatch: Swatch) -> some View {
        modifier(SwatchModifier(swatch: swatch))
    }
}

#Preview {
    ContentView(initialSwatch: "colors")
}
