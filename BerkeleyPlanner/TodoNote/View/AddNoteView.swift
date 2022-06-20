//
//  AddNoteView.swift
//  TodoNote
//

import SwiftUI

struct AddNoteView: View {
    let emoji = ["😄", "😭", "😡", "😪"]
    @State private var selectedEmoji = ""
    @State private var noteTitle = ""
    @State private var noteText = "Type something here"
    @State var selectedDate = Date()
    @EnvironmentObject var noteViewModel: NoteViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Text("Input Note Title : ")
                    .font(.title2)
                TextField("Note Title", text: $noteTitle)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                DatePicker("Date : ", selection: $selectedDate, displayedComponents: .date)
                    .font(.title2)
                    .padding(.top)
                
                TextEditor(text: $noteText)
                    .frame(height: 200, alignment: .leading)
                    .cornerRadius(3.0)
                    .colorMultiply(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.top)
                
                Text("Mood : \(selectedEmoji)")
                    .font(.title2)
                    .padding(.top)
                Picker("Mood", selection: $selectedEmoji) {
                    ForEach(emoji, id: \.self) {
                        Text($0)
                            .font(.largeTitle)
                    }
                }
                .pickerStyle(.segmented)
                .frame(height:20)
                
                HStack {
                    Spacer()
                    Button{
                        if noteTitle.count > 0 {
                            addButtonPressed()
                        }
                    } label:{
                        Text("Add New Note")
                            .padding(.all, 15)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .padding(.top)
            }
            .padding()
        }
        .navigationTitle("Add New Note 🗒")
    }
    func addButtonPressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let noteDate = dateFormatter.string(from: selectedDate)
        noteViewModel.addNote(title: noteTitle, date: "\(noteDate)", content: noteText, mood: selectedEmoji)
        // dismiss current view
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
