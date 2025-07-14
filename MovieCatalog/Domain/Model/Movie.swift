//
//  Movie.swift
//  MovieCatalog
//
//  Created by Dwi Aji Sobarna on 14/07/25.
//
import Foundation

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String?
    
    var posterURL: URL? {
        guard let path = poster_path else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
}
