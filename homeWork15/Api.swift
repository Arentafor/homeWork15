//
//  Api.swift
//  homeWork15
//
//  Created by Виталий Крюков on 12.03.2022.
//

import Foundation



protocol FilmLoaderDelegate {
    func filmsLoaded(films:[Film])
}

class Api {
    
    let constantUrl = "https://imdb-api.com/en/API/Search/k_il0e4iky/"
    var delegateFilms: FilmLoaderDelegate?
    
    func request(nameOfFilm: String) {
        
        var filmsArray: [Film] = []
        
        var urlRequest = URLRequest(url: URL(string: constantUrl + nameOfFilm)! )
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, responce, error in
            //            guard error != nil else { print("error"); return }
            //            print(responce)
            guard let data = data else { return }
            if let jsonArray = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                if let jsonDict = jsonArray["results"] as? NSArray {
                    
                    DispatchQueue.main.async {
                        for dict in jsonDict {
                            if let film = Film(data: dict as! NSDictionary) {
                                filmsArray.append(film)
                            }
                        }
                        self.delegateFilms?.filmsLoaded(films: filmsArray)
                    }
                    
                }
            }
        }
        task.resume()
    }
}
