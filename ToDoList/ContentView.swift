//
//  ContentView.swift
//  ToDoList
//
//  Created by Shira Stein on 4/28/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            HStack {
                Text ("KWK To-Do List")
                    .font(.largeTitle)
                    .fontWeight(.black)
                Spacer ()
                Button {
                    withAnimation {
                        showNewTask = true
                    }
                } label: {
                    Text ("+")
                        .font (.title)
                        .fontWeight (.bold)
                }
            }
            .padding ()
            Spacer ()
            List {
                ForEach (toDos) { ToDoItem in
                    if ToDoItem.isImportant {
                        Text ("‼️" + ToDoItem.title)
                    } else {
                        Text(ToDoItem.title)

                    }
                }
                .onDelete(perform: deleteToDo)
            }
            .listStyle(.plain)
        }
        if showNewTask {
            NewToDoView (showNewTask: $showNewTask, ToDoItem:ToDoItem(title:"",isImportant:false))
        }
    }
    func deleteToDo (at offsets: IndexSet) {
        for offset in offsets {
            let ToDoItem = toDos [offset]
            modelContext.delete(ToDoItem)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for:ToDoItem.self)
}
