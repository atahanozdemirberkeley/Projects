//
//  TodoViewModel.swift
//  TodoNote
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var todoItems: [TodoItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let todoItemKey: String = "todoItems_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: todoItemKey) else { return }
        
        guard let savedItems = try? JSONDecoder().decode([TodoItemModel].self, from: data) else { return }
        
        self.todoItems = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        todoItems.remove(atOffsets: indexSet )
    }
    
    func moveItem(from: IndexSet, to: Int) {
        todoItems.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String, category: String) {
        let newItem = TodoItemModel(title: title, category: category, checked: false)
        todoItems.append(newItem)
    }
    
    func updateItem(item: TodoItemModel) {
        if let idx = todoItems.firstIndex(where: { (existingItem) -> Bool in
            return existingItem.id == item.id
        }) {
            todoItems[idx] = item.updateCheck()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(todoItems) {
            UserDefaults.standard.set(encodedData, forKey: todoItemKey)
        }
    }
}
