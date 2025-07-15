//
//  AppContainer.swift
//  MovieCatalog
//
//  Created by Dwi Aji Sobarna on 14/07/25.
//

import Swinject

class AppContainer {
    static let shared = AppContainer()
    let container: Container

    private init() {
        container = Container()

        // Service
        container.register(MovieService.self) { _ in
            MovieService()
        }

        // Repository
        container.register(MovieRepository.self) { r in
            MovieRepositoryImpl(service: r.resolve(MovieService.self)!)
        }

        // UseCase
        container.register(GetPopularMoviesUseCase.self) { r in
            GetPopularMoviesUseCase(repository: r.resolve(MovieRepository.self)!)
        }
    }
}
