//
//  MovieStoreMock.swift
//  TheMoviesTests
//
//  Created by Matheus Bispo on 7/30/19.
//  Copyright © 2019 Matheus Bispo. All rights reserved.
//

import Foundation
@testable import TheMovies

class MovieStoreMock {
    var mock = [
        Movie(id: 0, title: "Filmes 0", image: .init(), releaseDate: "", overview: "", genres: [ Genre(id: 0, name: "Action") ]),
        Movie(id: 1, title: "Filmes 1", image: .init(), releaseDate: "", overview: "", genres: [ Genre(id: 0, name: "Action") ]),
        Movie(id: 2, title: "Filmes 2", image: .init(), releaseDate: "", overview: "", genres: [ Genre(id: 0, name: "Action") ]),
        Movie(id: 3, title: "Filmes 3", image: .init(), releaseDate: "", overview: "", genres: [ Genre(id: 0, name: "Action") ]),
        Movie(id: 4, title: "Filmes 4", image: .init(), releaseDate: "", overview: "", genres: [ Genre(id: 0, name: "Action") ]),
    ]
}
