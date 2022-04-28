//
//  ContentView.swift
//  BookTracker
//
//  Created by KET on 28/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddBookView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        BookDetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown book")
                                    .font(.headline)
                                Text(book.author ?? "Unknown author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
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
