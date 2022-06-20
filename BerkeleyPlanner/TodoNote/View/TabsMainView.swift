//
//  TabsMainView.swift
//  TodoNote
//

import SwiftUI

struct TabsMainView: View {
    var body: some View {
        TabView {
            TodoListView()
                .tabItem {
                    Label("My To-do List", systemImage: "list.dash")
                }
            NoteListView()
                .tabItem {
                    Label("My Note", systemImage: "note.text")
                }
        }
    }
}

struct TabsMainView_Previews: PreviewProvider {
    static var previews: some View {
        TabsMainView()
    }
}
