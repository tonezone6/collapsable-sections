//
//  RowView.swift
//  CollapsableSections
//
//  Created by Alex Stratu on 22.04.2021.
//

import SwiftUI

struct ItemView: View {
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(.gray)
                .padding(.top, 8)
            Spacer()
        }
        .contentShape(Rectangle())
    }
}
