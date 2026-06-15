//
//  SwatchView.swift
//  Swatches
//
//  Created by Pax Willoughby on 6/14/26.
//

import SwiftUI

struct SwatchView: View {
    let swatch: Swatch
    
    let initiallyShowAboutView: Bool
    
    @State private var showPopover = false
    
    @Environment(\.colorScheme) private var colorScheme
    @State private var colorSchemeOverride: ColorScheme? = nil
    private var appearanceSymbol: String {
        colorScheme == .light
        ? "sun.max.fill"
        : "moon.fill"
    }
    
    init(
        for swatch: Swatch,
        initiallyShowAboutView: Bool = false
    ) {
        self.swatch = swatch
        self.initiallyShowAboutView = initiallyShowAboutView
    }
    
    var body: some View {
        swatch.view
            .navigationTitle(swatch.name)
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(colorSchemeOverride)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("Toggle Appearance", systemImage: appearanceSymbol) {
                        toggleAppearance()
                    }
                    Spacer()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("About", systemImage: "questionmark") {
                        showPopover.toggle()
                    }
                    .popover(isPresented: $showPopover) {
                        popoverView
                            .presentationCompactAdaptation(.popover)
                    }
                    .onAppear {
                        Task {
                            if initiallyShowAboutView {
                                showPopover = true
                            }
                        }
                    }
                }
            }
    }
    
    @ViewBuilder
    private var popoverView: some View {
        VStack(alignment: .leading) {
            Text(swatch.description)
            Text("By " + swatch.author)
                .font(.footnote)
        }
        .padding()
        .frame(width: 280)
        
        // fixme))
        // The frame is a hack to get the text to wrap.
        // I don't like having a fixed, magic number.
        // There has to be a better way to wrap the description.
        // Issue #3 https://github.com/ziplyne1/Swatches/issues/3
    }
    
    private func toggleAppearance() {
        if colorSchemeOverride == nil {
            colorSchemeOverride = (colorScheme == .light)
            ? .dark
            : .light
        } else {
            colorSchemeOverride = (colorSchemeOverride == .light)
            ? .dark
            : .light
        }
    }
}

#Preview {
    NavigationStack {
        SwatchView(for: swatches[0], initiallyShowAboutView: true)
    }
}
#Preview {
    NavigationStack {
        SwatchView(for: swatches[1], initiallyShowAboutView: true)
    }
}
