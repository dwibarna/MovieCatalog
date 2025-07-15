//
//  MovieListView.swift
//  MovieCatalog
//
//  Created by Dwi Aji Sobarna on 15/07/25.
//

import SwiftUI

struct MovieListView: View {
    @EnvironmentObject var viewModel: MovieViewModel

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading movies...")
                } else if let error = viewModel.errorMessage {
                    Text("❌ \(error)")
                        .foregroundColor(.red)
                } else {
                    List(viewModel.movies) { movie in
                        HStack(alignment: .top, spacing: 16) {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(movie.posterPath ?? "")")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 80, height: 120)
                            .cornerRadius(8)

                            VStack(alignment: .leading, spacing: 8) {
                                Text(movie.title)
                                    .font(.headline)
                                Text(movie.overview)
                                    .font(.subheadline)
                                    .lineLimit(3)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("Popular Movies")
        }
        .task {
            await viewModel.fetchPopularMovies()
        }
    }
}

#Preview {
    MovieListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
