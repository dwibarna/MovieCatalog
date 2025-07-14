//
//  MovieRepository.swift
//  MovieCatalog
//
//  Created by Dwi Aji Sobarna on 14/07/25.
//

protocol MovieRepository {
    func getPopularMovies() async throws -> [Movie]
}
