//
//  TodoNoteApp.swift
//  TodoNote
//

import SwiftUI

@main
struct TodoNoteApp: App {
    @StateObject var todoViewModel: TodoViewModel = TodoViewModel()
    @StateObject var noteViewModel: NoteViewModel = NoteViewModel()

    var body: some Scene {
        WindowGroup {
            TabsMainView()
                .environmentObject(todoViewModel)
                .environmentObject(noteViewModel)
        }
        
    }
}
