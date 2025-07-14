//
//  MovieRepositoryImpl.swift
//  MovieCatalog
//
//  Created by Dwi Aji Sobarna on 14/07/25.
//

import Foundation

class MovieRepositoryImpl: MovieRepository {
    let service: MovieService
    
    init(service: MovieService) {
        self.service = service
    }
    
    func getPopularMovies() async throws -> [Movie] {
        let dtos = try await service.fetchPopularMovies()
        return dtos.map {
            MovieMapper.map($0)
        }
    }
}
