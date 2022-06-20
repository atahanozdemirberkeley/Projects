//
//  TodoItemModel.swift
//  TodoNote
//

import Foundation

struct TodoItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let category: String
    let checked: Bool
    
    init(id: String = UUID().uuidString, title: String, category: String, checked: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.category = category
        self.checked = checked
    }
    
    func updateCheck() -> TodoItemModel {
        return TodoItemModel(id: id, title: title, category: category, checked: !checked)
    }
    
}
