//
//  AboutView.swift
//  Swatches
//
//  Created by Pax Willoughby on 6/13/26.
//

import SwiftUI

struct AboutView: View {
    let links = UrlService()
    
    var body: some View {
        List {
            Text("Swatches is an app built for devs to quickly preview various SwiftUI features. If there’s a swatch you’d like to see added, feel free to reach out. (Or, if you’re feeling adventurous, submit a PR!)")
            
            Section("Get in touch") {
                listRowLink(
                    destination: links.marketing,
                    title: "Website",
                    systemImage: "safari"
                )
                listRowLink(
                    destination: links.email,
                    title: "Email",
                    systemImage: "envelope"
                )
                listRowLink(
                    destination: links.github,
                    title: "GitHub",
                    image: "github-logo"
                )
            }
            
            Section {
                HStack {
                    listRowLink(
                        destination: links.homepage,
                        title: "Developed by ziplyne",
                        systemImage: "heart"
                    )
                    
                    Spacer()
                    
                    Text(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "Unknown Version")
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                }
            }
        }
        .presentationDetents([.medium, .large])
    }
    
    @ViewBuilder
    private func listRowLink(
        destination: URL,
        title: LocalizedStringKey,
        image: String? = nil,
        systemImage: String? = nil
    ) -> some View {
        Link(destination: destination) {
            Label {
                Text(title)
            } icon: {
                if let image {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                } else if let systemImage {
                    Image(systemName: systemImage)
                } else {
                    Image(systemName: "paperplane")
                }
            }
        }
    }
}

#Preview {
    ContentView(
        initiallyPresentAboutView: true
    )
}
