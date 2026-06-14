//
//  Swatch+link.swift
//  Swatches
//
//  Created by Pax Willoughby on 6/13/26.
//

import Foundation
import SwiftUI

extension Swatch {
    @ViewBuilder func link() -> some View {
        NavigationLink(value: self) {
            Label {
                Text(name)
                Text(description)
            } icon: {
                Image(systemName: icon)
            }
            .labelStyle(GlassIconLabelStyle(color: color))
        }
    }
}

struct GlassIconLabelStyle: LabelStyle {
    var color: Color
    
    @ScaledMetric(relativeTo: .title) private var fontSize: CGFloat = 18
    
    func makeBody(configuration: Configuration) -> some View {
        let roundRect = RoundedRectangle(cornerRadius: fontSize * 2/3)
        
        Label {
            configuration.title
        } icon: {
            configuration.icon
                .imageScale(.medium)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width: fontSize * 2, height: fontSize * 2)
                .glassEffect(.regular.tint(color), in: roundRect)
        }
        
    }
}

#Preview {
    ContentView()
}
