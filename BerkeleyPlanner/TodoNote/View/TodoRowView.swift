//
//  TodoRowView.swift
//  TodoNote
//

import SwiftUI

struct TodoRowView: View {

    @State var item: TodoItemModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.callout)
                Text(item.category)
                    .font(.footnote)
            }
            Spacer()
            if item.checked {
                Image(systemName: "checkmark.square")
                    .foregroundColor(.green)
                    .padding(.horizontal)
            } else {
                Image(systemName: "square")
                    .foregroundColor(.red)
                    .padding(.horizontal)
            }
        }
    }
}
