//
//  Filmes.swift
//  Filmes-MVVM
//
//  Created by Leticia Sousa Siqueira on 14/01/21.
//

struct Filmes: Decodable {
    
    let count: Int?
    let all: [Filme]
    
    enum CodingKeys: String, CodingKey {
        case count
        case all = "results"
    }
    
}
