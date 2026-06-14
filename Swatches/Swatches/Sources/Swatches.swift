//
//  Swatches.swift
//  Swatches
//
//  Created by Pax Willoughby on 6/13/26.
//

import Foundation
import SwiftUI

let swatches: [Swatch] = [
    Swatch(
        id: "colors",
        name: "Colors",
        author: "ziplyne",
        description: "The standard SwiftUI colors.",
        icon: "paintpalette.fill",
        color: .green,
        view: Colors()
    ),
    Swatch(
        id: "haptic feedback",
        name: "Haptic Feedback",
        author: "ziplyne",
        description: "The available haptic patterns for the `.sensoryFeedback` modifier.",
        icon: "iphone.radiowaves.left.and.right",
        color: .blue,
        view: HapticFeedback()
    )
]

#Preview {
    ContentView()
}
