//
//  TodoListView.swift
//  TodoNote
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todoViewModel.todoItems) { todoItem in
                    TodoRowView(item: todoItem)
                        .onTapGesture {
                            todoViewModel.updateItem(item: todoItem)
                        }
                }
                .onDelete(perform: todoViewModel.deleteItem)
                .onMove(perform: todoViewModel.moveItem)
            }
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink(destination: AddTodoView()) {
                Label("Add Item", systemImage: "plus")
                    })
            .navigationTitle("My To-do List 📝")
        }
    }
    
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
