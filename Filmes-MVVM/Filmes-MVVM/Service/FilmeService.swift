//
//  FilmeService.swift
//  Filmes-MVVM
//
//  Created by Leticia Sousa Siqueira on 14/01/21.
//

import Foundation
import UIKit
import Alamofire

protocol FilmeServiceProtocol {
    func getDataFromServer(complete: @escaping (_ success: Bool, _ filme: [Filme]? )->() )
}

class FilmeService : FilmeServiceProtocol {
    
    func getDataFromServer(complete: @escaping (Bool, [Filme]?) -> ()) {
           
           let request = AF.request("https://api.themoviedb.org/3/trending/movie/week?api_key=4d3af2ecd868ddee8ae767825e9a0d64&language=pt-BR")
           
           request.responseDecodable(of: Filmes.self) { (response) in
               guard let filmes = response.value else { return }
               
               var listaFilmes: [Filme] = [Filme]()
               
               for i in 0...15{
                   listaFilmes.append(Filme(title: "\(filmes.all[i].title)", overview: "\(filmes.all[i].overview)"))
               }
               
               complete(true, listaFilmes)
               
           }
        
    }
    
    
}
