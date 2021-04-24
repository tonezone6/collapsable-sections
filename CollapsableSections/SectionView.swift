//
//  SectionView.swift
//  CollapsableSections
//
//  Created by Alex Stratu on 22.04.2021.
//

import SwiftUI

struct SectionView: View {
    let section: Section
    let expanded: Bool
    var selection: ((String) -> Void)?
    
    var showItems: Bool {
        section.items.count > 0
    }

    var body: some View {
        VStack {
            HStack {
                Text(section.title)
                Spacer()
                if showItems {
                    Image.SFSymbol(.chevronRight)
                        .frame(width: 10, height: 10)
                        .rotationEffect(expanded ? .degrees(90) : .zero)
                }
            }
            .contentShape(Rectangle())
            
            if expanded, showItems {
                ForEach(section.items, id: \.self) { text in
                    ItemView(text: text)
                        .onTapGesture {
                            selection?(text)
                        }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(section: .example, expanded: false, selection: nil)
    }
}
