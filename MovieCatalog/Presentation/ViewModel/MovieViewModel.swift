//
//  MovieViewModel.swift
//  MovieCatalog
//
//  Created by Dwi Aji Sobarna on 15/07/25.
//

import Foundation

@MainActor
class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let getPopularMovieUseCase: GetPopularMoviesUseCase
    
    init(getPopularMovieUseCase: GetPopularMoviesUseCase) {
        self.getPopularMovieUseCase = getPopularMovieUseCase
    }
    
    func fetchPopularMovies() async {
        isLoading = true
        do {
            movies = try await getPopularMovieUseCase.execute()
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
