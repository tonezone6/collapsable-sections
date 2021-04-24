//
//  ContentView.swift
//  CollapsableSections
//
//  Created by Alex Stratu on 22.04.2021.
//

import SwiftUI

struct SectionListView: View {
    @State private var selected: Set<Section> = []
    
    var body: some View {
        ScrollView {
            ForEach(Section.all) { section in
                SectionView(
                    section: section,
                    expanded: selected.contains(section),
                    selection: { item in
                        print(item)
                    }
                )
                .animation(.easeOut(duration: 0.15))
                .onTapGesture {
                    handle(selected: section)
                }
            }
            // Insets.
            .padding([.top, .leading, .trailing], 16)
        }
        .background(Color(.systemGroupedBackground))
        .edgesIgnoringSafeArea([.bottom])
    }
    
    private func handle(selected section: Section) {
        if section.items.isEmpty {
            print(section.title)
        } else {
            if selected.contains(section) {
                selected.remove(section)
            } else {
                // selection.removeAll()
                selected.insert(section)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SectionListView()
    }
}
