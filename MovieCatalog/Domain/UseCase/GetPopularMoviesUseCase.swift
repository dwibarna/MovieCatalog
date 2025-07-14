//
//  GetPopularMoviesUseCase.swift
//  MovieCatalog
//
//  Created by Dwi Aji Sobarna on 14/07/25.
//

final class GetPopularMoviesUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Movie] {
        try await repository.getPopularMovies()
    }
}
