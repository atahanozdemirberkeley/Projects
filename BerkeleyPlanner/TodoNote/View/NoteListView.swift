//
//  NoteListView.swift
//  TodoNote
//

import SwiftUI

struct NoteListView: View {
    @EnvironmentObject var noteViewModel: NoteViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(noteViewModel.notes) { note in
                    NavigationLink {
                        NoteDetailView(note: note)
                    } label: {
                        NoteRowView(note: note)
                    }
                }
                .onDelete(perform: noteViewModel.deleteNote)
                .onMove(perform: noteViewModel.moveNote)
            }
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink(destination: AddNoteView()) {
                Label("Add Note", systemImage: "plus")
                    })
            .navigationTitle("My Notes 🗒")
            .listStyle(.plain)
        }
        
    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NoteListView()
    }
}
