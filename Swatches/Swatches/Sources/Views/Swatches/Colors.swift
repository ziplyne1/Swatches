//
//  Colors.swift
//  Swatches
//
//  Created by Pax Willoughby on 6/13/26.
//

import SwiftUI

struct Colors: View {
    let colors: [(name: String, color: Color)] = [
        ("Pink",   .pink),
        ("Red",    .red),
        ("Orange", .orange),
        ("Yellow", .yellow),
        ("Green",  .green),
        ("Mint",   .mint),
        ("Teal",   .teal),
        ("Cyan",   .cyan),
        ("Blue",   .blue),
        ("Indigo", .indigo),
        ("Purple", .purple),
        ("Brown",  .brown)
    ]
    
    @State private var showGlass = true
    
    var body: some View {
        ScrollView {
            ForEach(colors, id: \.name) { color in
                if showGlass {
                    row(color).glassEffect(.regular.interactive())
                } else {
                    row(color)
                }
            }
            .padding()
        }
        .toolbar {
            ToolbarItem {
                Button(
                    "Toggle Glass",
                    systemImage: (showGlass) ? "eyeglasses" : "eyeglasses.slash"
                ) { showGlass.toggle() }
            }
        }
    }
    
    @ViewBuilder
    private func row(_ color: (name: String, color: Color)) -> some View {
        ZStack {
            Capsule()
                .foregroundStyle(color.color)
            Text(color.name)
                .foregroundStyle(.white)
                .font(.title)
                .fontDesign(.rounded)
                .padding(8)
        }
    }
}

#Preview {
    ContentView(
        initialSwatch: "colors"
    )
}
