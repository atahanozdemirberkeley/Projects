//
//  AddTodoView.swift
//  TodoNote
//

import SwiftUI

struct AddTodoView: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    let categories = ["Academics 📚", "Diet 🌱", "Exercise 🏀", "Work 💼", "Other 💰"]
    @State private var selectedCategory = "Academics 📚"
    @State private var itemName = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Input item name")
                    .font(.title2)
                TextField("Item Name", text: $itemName)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                Text("Selected Category: \(selectedCategory)")
                    .font(.title2)
                    .padding(.top)
                Picker("Cat", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) {
                        Text($0)
                            .font(.subheadline)
                    }
                }
                .pickerStyle(.menu)
                
                HStack {
                    Spacer()
                    Button{
                        if itemName.count > 0 {
                            addButtonPressed()
                        }
                    } label:{
                        Text("Add New Item")
                            .padding(.all, 15)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .padding(.top, 100)
            }
            .padding()
        }
        .navigationTitle("Add New Item ✏️")
    }
    
    func addButtonPressed(){
        todoViewModel.addItem(title: itemName, category: selectedCategory)
        // dismiss current view
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
