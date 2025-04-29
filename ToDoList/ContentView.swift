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
                    Text(ToDoItem.title)
                    
                }
            }
        }
        if showNewTask {
            NewToDoView ()
        }
    }
}

#Preview {
    ContentView()
}
