//
//  MovieDetailView.swift
//  MovieCatalog
//
//  Created by Dwi Aji Sobarna on 15/07/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: movie.posterURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(movie.title)
                        .font(.title)
                        .fontWeight(.bold)

                    Text(movie.overview)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
            }
        }
        
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
