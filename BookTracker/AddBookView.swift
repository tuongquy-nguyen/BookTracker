//
//  AddBookView.swift
//  BookTracker
//
//  Created by KET on 28/04/2022.
//

import SwiftUI
import CoreData

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var rating = 3
    @State private var review = ""
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    Picker("Book's genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    TextEditor(text: $review)
                    BookRatingView(rating: $rating)
                } header: {
                    Text("Write your review about this book")
                }
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.genre = genre
                        newBook.review = review
                        newBook.rating = Int16(rating)
                        try? moc.save()
                        dismiss()
                    }
     
//                    JUST FOR DELETE ALL DATA OF BOOK INSTANCE
//                    Button("Reset all") {
//                        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Book")
//                        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//                        do {
//                            try moc.execute(batchDeleteRequest)
//                            dismiss()
//                        } catch {
//                            print("Error")
//                        }
//                    }
                }
            }
            .navigationTitle("Add New Book")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
.previewInterfaceOrientation(.portrait)
    }
}
