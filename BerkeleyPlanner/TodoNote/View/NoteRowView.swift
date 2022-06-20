//
//  NoteRowView.swift
//  TodoNote
//

import SwiftUI

struct NoteRowView: View {
    @State var note: NoteModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.body)
                Text(note.date)
                    .font(.footnote)
            }
            Spacer()
            Text(note.mood)
                .font(.title2)
                .padding(.horizontal)
        }
    }
}
