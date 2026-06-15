//
//  Swatch.swift
//  Swatches
//
//  Created by Pax Willoughby on 6/13/26.
//

import Foundation
import SwiftUI

/// A model representing a Swatch with a localized name, icon, color, and an associated View.
///
/// Conforms to `Identifiable` for use in ForEach.
///
/// - Parameters:
///   - name: A key to a localized display name for the Swatch. Supports some markdown.
///   - description: A key to a localized description of the Swatch. Supports some markdown.
///   - icon: The SF Symbol name used to represent the Swatch.
///   - color: The Swatch's display color. Used for its icon in the main view
///   - view: The SwiftUI view associated with the Swatch. This is automatically formatted with a navigation title, an explanation button, and more.
struct Swatch: Identifiable {
    var id: String
    var name: LocalizedStringKey
    var author: String
    var description: LocalizedStringKey
    var icon: String
    var color: Color
    var view: AnyView
    
    init<V: View>(
        id: String,
        name: LocalizedStringKey,
        author: String,
        description: LocalizedStringKey,
        icon: String,
        color: Color,
        view: V
    ) {
        self.id = id
        self.name = name
        self.author = author
        self.description = description
        self.icon = icon
        self.color = color
        self.view = AnyView(view)
    }
}

extension Swatch: Equatable, Hashable {
    static func == (lhs: Swatch, rhs: Swatch) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
