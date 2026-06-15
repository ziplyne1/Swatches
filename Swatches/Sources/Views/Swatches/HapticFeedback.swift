//
//  HapticFeedback.swift
//  Swatches
//
//  Created by Pax Willoughby on 6/13/26.
//

import SwiftUI

struct HapticPattern: Identifiable {
    let id: String
    let feedback: SensoryFeedback
    var trigger: Bool
    
    init(_ id: String, _ feedback: SensoryFeedback) {
        self.id = id
        self.feedback = feedback
        self.trigger = false
    }
}

struct HapticFeedback: View {
    @State private var patterns: [HapticPattern] = [
        HapticPattern("alignment", .alignment),
        HapticPattern("decrease", .decrease),
        HapticPattern("error", .error),
        HapticPattern("impact", .impact), // todo)) implement impact parameters
        HapticPattern("increase", .increase),
        HapticPattern("levelChange", .levelChange),
        HapticPattern("pathComplete", .pathComplete),
        HapticPattern("selection", .selection),
        HapticPattern("start", .start),
        HapticPattern("stop", .stop),
        HapticPattern("success", .success)
    ]
    
    var body: some View {
        List {
            ForEach($patterns) { $pattern in
                Button(pattern.id) {
                    pattern.trigger.toggle()
                }
                .sensoryFeedback(pattern.feedback, trigger: pattern.trigger)
            }
        }
    }
}

#Preview {
    ContentView(
        initialSwatch: "haptic feedback"
    )
}
