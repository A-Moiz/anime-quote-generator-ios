//
//  ContentView.swift
//  Anime Quote Generator
//
//  Created by Abdul Moiz on 04/03/2026.
//

import SwiftUI

// MARK: - Display all quotes
struct AllQuotesView: View {
    @Environment(Database.self) var db
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(db.allQuotes, id: \.id) { quote in
                        QuoteView(quote: quote.quote, quoteCharacter: quote.character, anime: quote.anime, characterImg: quote.characterImg)
                    }
                }
            }
            .navigationTitle("All Quotes")
            .task {
                await db.fetchAllQuotes()
            }
        }
    }
}

// MARK: - Each quote design
struct QuoteView: View {
    let quote: String
    let quoteCharacter: String
    let anime: String
    let characterImg: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: characterImg)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack(alignment: .leading, spacing: 8) {
                Text("“\(quote)”")
                    .font(.body)
                    .foregroundStyle(.primary)
                    .fixedSize(horizontal: false, vertical: true)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(quoteCharacter)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Text(anime)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemGray6))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue, lineWidth: 3)
        )
        .padding(.horizontal)
    }
}

#Preview {
    AllQuotesView()
        .environment(Database())
}
