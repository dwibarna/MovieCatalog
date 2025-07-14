//
//  MovieResponse.swift
//  MovieCatalog
//
//  Created by Dwi Aji Sobarna on 14/07/25.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [MovieDTO]
}

struct MovieDTO: Decodable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String?
}
