//
//  Secrets.swift
//  MovieCatalog
//
//  Created by Dwi Aji Sobarna on 14/07/25.
//

import Foundation

enum Secrets {
    static var tmdbBaseURL: String {
        getValue(for: "TMDB_BASE_URL")
    }
    
    static var tmdbAPIKey: String {
        getValue(for: "TMDB_API_KEY")
    }
    
    private static func getValue(for key: String) -> String {
        guard let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let value = dict[key] as? String else {
            fatalError("🚨 Missing \(key) in Secrets.plist")
        }
        return value
    }
}
