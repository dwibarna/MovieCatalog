//
//  MovieService.swift
//  MovieCatalog
//
//  Created by Dwi Aji Sobarna on 14/07/25.
//

import Alamofire

class MovieService {
    func fetchPopularMovies() async throws -> [MovieDTO] {
        let url = "\(Secrets.tmdbBaseURL)movie/popular?api_key=\(Secrets.tmdbAPIKey)"
        
        let response = try await AF.request(url)
            .serializingDecodable(MovieResponse.self)
            .value
        
        return response.results
    }
}
