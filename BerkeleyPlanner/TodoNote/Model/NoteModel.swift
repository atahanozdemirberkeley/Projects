//
//  NoteModel.swift
//  TodoNote
//

import Foundation

struct NoteModel: Identifiable, Codable {
    let id: String
    let title: String
    let date: String
    let content: String
    let mood: String
    
    init(id: String = UUID().uuidString, title: String, date: String, content: String, mood: String) {
        self.id = UUID().uuidString
        self.title = title
        self.date = date
        self.content = content
        self.mood = mood
    }
}
