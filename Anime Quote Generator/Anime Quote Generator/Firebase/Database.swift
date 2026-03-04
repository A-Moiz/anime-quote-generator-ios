//
//  Database.swift
//  Anime Quote Generator
//
//  Created by Abdul Moiz on 04/03/2026.
//

import Foundation
import Firebase
import FirebaseFirestore

@Observable
@MainActor
class Database {
    var allQuotes: [Quote] = []
    let collectionName: String = "anime-quotes"
    
    func fetchAllQuotes() async {
        let db = Firestore.firestore()
        do {
            let snapshot = try await db.collection(collectionName).getDocuments()
            self.allQuotes = snapshot.documents.compactMap { document in
                try? document.data(as: Quote.self)
            }
        } catch {
            print("Fetch failed: \(error.localizedDescription)")
        }
    }
}
