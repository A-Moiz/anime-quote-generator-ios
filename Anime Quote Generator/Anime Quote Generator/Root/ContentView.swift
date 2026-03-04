//
//  ContentView.swift
//  Anime Quote Generator
//
//  Created by Abdul Moiz on 04/03/2026.
//

import SwiftUI

struct ContentView: View {
    @Environment(Database.self) var db
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await db.fetchAllQuotes()
        }
    }
}

#Preview {
    ContentView()
        .environment(Database())
}
