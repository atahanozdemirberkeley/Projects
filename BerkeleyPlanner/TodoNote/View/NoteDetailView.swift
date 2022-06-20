//
//  NoteDetailView.swift
//  TodoNote
//

import SwiftUI

struct NoteDetailView: View {
    @State var note: NoteModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(note.date)
                    .font(.callout)
                Divider()
                Text("Notes")
                    .font(.headline)
                Text(note.content)
                    .padding()
                    .frame(minWidth: 150, maxWidth: .infinity, minHeight: 150, maxHeight: .infinity)
                    .cornerRadius(3.0)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }.padding()
        }
        .navigationTitle("\(note.title)  \(note.mood)")
    }
}

