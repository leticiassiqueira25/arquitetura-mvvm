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
    func getDataFromServer(complete: @escaping (_ success: Bool, _ filme: [Filme]? ) -> Void )
}

class FilmeService : FilmeServiceProtocol {
    
    func getDataFromServer(complete: @escaping (Bool, [Filme]? ) -> Void ) {
           
           let request = AF.request("https://api.themoviedb.org/3/trending/movie/week?api_key=4d3af2ecd868ddee8ae767825e9a0d64&language=pt-BR")
           
           request.responseDecodable(of: Filmes.self) { (response) in
               guard let filmes = response.value else { return }
               
               var listaFilmes: [Filme] = [Filme]()
               
               for item in 0...15 {
                   listaFilmes.append(Filme(title: "\(filmes.all[item].title)", overview: "\(filmes.all[item].overview)"))
               }
               
               complete(true, listaFilmes)
               
           }
        
    }
    
}
