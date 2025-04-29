//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Shira Stein on 4/28/25.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    @Binding var showNewTask: Bool
    @Bindable var ToDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            Text ("Task Title:")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Enter the task description...", text: $ToDoItem.title)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            Toggle(isOn: $ToDoItem.isImportant) {
                Text ("Is it important?")
            }
            Button {
                addToDo()
                showNewTask = false
            } label: {
                Text ("Save")
            }
        }
        .padding()
    }
    
    func addToDo() {
        let toDo = ToDoList.ToDoItem(title: ToDoItem.title, isImportant: ToDoItem.isImportant)
        modelContext.insert(toDo)
    }
}

#Preview {
    NewToDoView(showNewTask: .constant (false),  ToDoItem: ToDoItem(title:"", isImportant: false))
}
