//
//  Section.swift
//  CollapsableSections
//
//  Created by Alex Stratu on 22.04.2021.
//

import Foundation

struct Section: Hashable {
    let title: String
    let items: [String]
}

extension Section: Identifiable {
    var id: String { title }
}

extension Section {
    static var all: [Section] {
        [
            Section(title: "First", items: ["lorem", "ipsum", "dolor"]),
            Section(title: "Second", items: ["sit", "amet"]),
            Section(title: "Third", items: []),
            Section(title: "Fourth", items: ["consectetur", "adipiscing", "elit", "sed", "do"])
        ]
    }
    
    static var example: Section {
        all.first!
    }
}
