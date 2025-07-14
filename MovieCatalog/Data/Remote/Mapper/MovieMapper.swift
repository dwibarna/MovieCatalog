//
//  MovieMapper.swift
//  MovieCatalog
//
//  Created by Dwi Aji Sobarna on 14/07/25.
//

import Foundation

struct MovieMapper {
    static func map(_ dto: MovieDTO) -> Movie {
        return Movie(
            id: dto.id,
            title: dto.title,
            overview: dto.overview,
            posterPath: dto.poster_path
        )
    }
}
