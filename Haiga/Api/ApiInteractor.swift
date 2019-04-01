//
//  ApiInteractor.swift
//  Haiga
//
//  Created by Sebastian Cipolat on 31/03/2019.
//  Copyright © 2019 Sebastian Cipolat. All rights reserved.
//

import Foundation
import Alamofire

class ApiInteractor {
    
    func getLastMovies(start_date:String,final_date:String,callback:MoviesApiListen){
        Alamofire.request(Api.HOST+Api.MOVIE_DISCOVER,
                          parameters: ["primary_release_date.gte":start_date, "primary_release_date.lte":final_date,"api_key":Api.KEY],
                          encoding: URLEncoding.default) .responseJSON { response in
        
                            guard let data = response.data else { return }
                            do {
                                let decoder = JSONDecoder()
                                let moviesResponse = try decoder.decode(Movies.self, from: data)
                                print(moviesResponse.totalPages)
                                callback.onMoviesReady(response: moviesResponse)
                            } catch let error {
                                print(error)
                            }
                            
        }
    }
}
