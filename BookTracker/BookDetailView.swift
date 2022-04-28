//
//  BookDetailView.swift
//  BookTracker
//
//  Created by KET on 28/04/2022.
//

import SwiftUI
import CoreData

struct BookDetailView: View {
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(Color.white)
                    .clipShape(Capsule())
                    .offset(x: -8, y: -8)
            }
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundColor(.secondary)
                .padding(5)
            Text(book.review ?? "No review about this book")
                .padding(5)
            BookRatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
                .padding(5)
        }
    }
}

