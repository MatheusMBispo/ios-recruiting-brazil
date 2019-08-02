//
//  Movie.swift
//  ViperitTest
//
//  Created by Matheus Bispo on 7/26/19.
//  Copyright © 2019 Matheus Bispo. All rights reserved.
//

import UIKit
import RxSwift


/// Estrutura utilizada para mapear resposta da requisição de filmes
struct MoviesResponse: Codable {
    
    public let page: Int
    public let totalResults: Int
    public let totalPages: Int
    public let results: [MovieEntity]
}

struct MovieEntity: Codable {
    var id: Int
    var title: String
    var posterPath: String
    var releaseDate: String
    var overview: String
    var genreIds: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath
        case releaseDate
        case overview
        case genreIds
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? "Title"
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate) ?? "2000-10-01"
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? ""
        self.genreIds = try container.decodeIfPresent([Int].self, forKey: .genreIds) ?? []
    }
}


/// Estrutura utilizada no decorrer da aplicação
final class Movie {
    let id: Int
    let title: String
    let image: UIImage
    let releaseDate: String
    let overview: String
    let genres: [Genre]
    private(set) var liked: Bool = false
    
    enum MovieError: Error {
        case genreNotFound
        case imageNotFound
    }
    
    init(id: Int, title: String, image: UIImage, releaseDate: String, overview: String, genres: [Genre], liked: Bool = false) {
        self.id = id
        self.title = title
        self.image = image
        self.releaseDate = releaseDate
        self.overview = overview
        self.genres = genres
        self.liked = liked
    }
    
    func setFavorite(value: Bool) {
        self.liked = value
    }
}

