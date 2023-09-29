//
//  ContentView.swift
//  CollapsableSections
//
//  Created by Alex Stratu on 22.04.2021.
//

import SwiftUI

struct SectionsListView: View {
  @State private var selected: Set<Section> = []
  
  var body: some View {
    ScrollView {
      ForEach(Section.all) { section in
        Button {
          withAnimation(.spring(duration: 0.2)) {
            handle(selected: section)
          }
        } label: {
          SectionRow(
            section: section,
            expanded: selected.contains(section),
            selection: { item in
              print(item)
            }
          )
        }
      }
      .buttonStyle(.plain)
      .padding()
    }
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

#Preview {
  NavigationStack {
    SectionsListView()
      .navigationTitle("Sections")
  }
}
