//
//  ContentView.swift
//  Swatches
//
//  Created by Pax Willoughby on 6/13/26.
//

import SwiftUI



struct ContentView: View {
    @State private var navPath = NavigationPath()
    @State private var presentAboutView = false
    private let initiallyPresentAboutView: Bool
    
    init(
        initialSwatch initialId: String? = nil,
        initiallyPresentAboutView: Bool = false
    ) {
        if let id = initialId,
           let swatch = swatches.first(where: { $0.id == id })
        {
            self._navPath = State(initialValue: NavigationPath([swatch]))
        }
        
        self.initiallyPresentAboutView = initiallyPresentAboutView
    }
    
    var body: some View {
        NavigationStack(path: $navPath) {
            List {                
                ForEach(swatches) { swatch in
                    swatch.link()
                }
            }
            .navigationTitle("Swatches")
            .navigationDestination(for: Swatch.self) { swatch in
                swatch.view
                    .swatchModifier(for: swatch)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("About", systemImage: "questionmark") {
                        presentAboutView = true
                    }
                    .popover(isPresented: $presentAboutView) {
                        AboutView()
                    }
                    .onAppear { Task {
                        if initiallyPresentAboutView {
                            presentAboutView = true
                        }
                    } }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
