//
//  Image+SFSymbol.swift
//  CollapsableSections
//
//  Created by Alex Stratu on 24.04.2021.
//

import SwiftUI

extension Image {
    struct SFSymbol: View {
        let name: String
        let tint: Color
        var weight: Font.Weight = .semibold
        
        init(_ systemName: SystemName, tint: Color = .primary, weight: Font.Weight = .semibold) {
            self.name = systemName.rawValue
            self.tint = tint
            self.weight = weight
        }
        
        var body: some View {
            Image(systemName: name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .font(Font.title.weight(weight))
                .foregroundColor(tint)
        }
    }
}

extension Image.SFSymbol {
    enum SystemName: String {
        case chevronRight = "chevron.right"
    }
}
