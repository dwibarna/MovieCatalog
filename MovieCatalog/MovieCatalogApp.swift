//
//  MovieCatalogApp.swift
//  MovieCatalog
//
//  Created by Dwi Aji Sobarna on 14/07/25.
//

import SwiftUI

@main
struct MovieCatalogApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            
            let container = AppContainer.shared.container
            let useCase = container.resolve(GetPopularMoviesUseCase.self)!
            let viewModel = MovieViewModel(getPopularMovieUseCase: useCase)
            
            MovieListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(viewModel)
        }
    }
}
