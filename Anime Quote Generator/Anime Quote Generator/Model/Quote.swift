//
//  Quote.swift
//  Anime Quote Generator
//
//  Created by Abdul Moiz on 04/03/2026.
//

import Foundation
import FirebaseFirestore

struct Quote: Codable, Identifiable {
    @DocumentID var id: String?
    let quote: String
    let character: String
    let characterImg: String
    let anime: String
}
