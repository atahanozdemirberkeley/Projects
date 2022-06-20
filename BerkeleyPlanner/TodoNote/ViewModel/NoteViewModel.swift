//
//  NoteViewModel.swift
//  TodoNote
//

import Foundation

class NoteViewModel: ObservableObject {
    
    @Published var notes: [NoteModel] = [] {
        didSet {
            saveNotes()
        }
    }
    
    let noteKey: String = "note_list"
    
    init() {
        getNotes()
    }
    
    func getNotes() {
        guard let data = UserDefaults.standard.data(forKey: noteKey) else { return }
        
        guard let savedItems = try? JSONDecoder().decode([NoteModel].self, from: data) else { return }
        
        self.notes = savedItems
    }
    
    func deleteNote(indexSet: IndexSet) {
        notes.remove(atOffsets: indexSet )
    }
    
    func moveNote(from: IndexSet, to: Int) {
        notes.move(fromOffsets: from, toOffset: to)
    }
    
    func addNote(title: String, date: String, content: String, mood: String) {
        let newItem = NoteModel(title: title, date: date, content: content, mood: mood)
        notes.append(newItem)
    }
    
    func saveNotes(){
        if let encodedData = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encodedData, forKey: noteKey)
        }
    }
}
