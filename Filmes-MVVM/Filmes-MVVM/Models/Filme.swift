//
//  Filme.swift
//  Filmes-MVVM
//
//  Created by Leticia Sousa Siqueira on 14/01/21.
//

struct Filme : Decodable {
    
    var title: String
    var overview: String
    
    enum CodingKeys: String, CodingKey{
        case title
        case overview
    }
}

