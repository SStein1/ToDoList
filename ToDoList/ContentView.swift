//
//  ContentView.swift
//  ToDoList
//
//  Created by Shira Stein on 4/28/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showNewTask = false
    
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
        }
        if showNewTask {
            NewToDoView ()
        }
    }
}

#Preview {
    ContentView()
}
