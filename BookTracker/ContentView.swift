//
//  ContentView.swift
//  BookTracker
//
//  Created by KET on 28/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    @State private var showingAddBookView = false
    var body: some View {
        NavigationView {
            Text(String(books.count))
                .navigationTitle("Book Tracker")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddBookView.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
        }
        .sheet(isPresented: $showingAddBookView) {
            AddBookView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
