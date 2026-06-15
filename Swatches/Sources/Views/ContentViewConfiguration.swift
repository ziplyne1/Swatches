//
//  ContentViewConfiguration.swift
//  Swatches
//
//  Created by Pax Willoughby on 6/13/26.
//


import SwiftUI

struct ContentViewPreviewConfiguration {
    let initialId: String?
    let initiallyPresentAboutView: Bool
    
    init(
        startingAt: String? = nil,
        initiallyPresentAboutView: Bool = false
    ) {
        self.initialId = startingAt
        self.initiallyPresentAboutView = initiallyPresentAboutView
    }
}
