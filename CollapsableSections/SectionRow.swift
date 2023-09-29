//
//  SectionView.swift
//  CollapsableSections
//
//  Created by Alex Stratu on 22.04.2021.
//

import SwiftUI

struct SectionRow: View {
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
          .font(.headline)
        Spacer()
        if showItems {
          Image(systemName: "chevron.right")
            .resizable()
            .scaledToFit()
            .frame(width: 10, height: 10)
            .fontWeight(.bold)
            .rotationEffect(expanded ? .degrees(90) : .zero)
            .foregroundStyle(.secondary)
        }
      }
      .contentShape(Rectangle())
      
      if expanded, showItems {
        ForEach(section.items, id: \.self) { text in
          HStack {
            Text(text)
              .foregroundColor(.gray)
              .padding(.top, 8)
            Spacer()
          }
          .contentShape(Rectangle())
          .onTapGesture {
            selection?(text)
          } 
        }
      }
    }
    .padding()
    .background(Color.gray.opacity(0.1))
    .cornerRadius(8)
  }
}

#Preview {
  SectionRow(section: .example, expanded: false, selection: nil)
}
