//
//  WebLinks.swift
//  Swatches
//
//  Created by Pax Willoughby on 6/13/26.
//

import Foundation

struct UrlService {
    let homepage: URL
    let marketing: URL
    let github: URL
    
    let email: URL
    
    
    init() {
        self.homepage = URL(string: "https://ziplyne.dev")!
        self.marketing = URL(string: "https://ziplyne.dev/projects/swatches")!
        self.github = URL(string: "https://github.com/ziplyne1/Swatches")!
        
        self.email = URL(string: "mailto:pax@ziplyne.dev?subject=Swatches%20Feedback")!
    }
}
