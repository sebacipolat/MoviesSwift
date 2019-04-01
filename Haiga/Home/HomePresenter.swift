//
//  HomePresenter.swift
//  Haiga
//
//  Created by Sebastian Cipolat on 31/03/2019.
//  Copyright © 2019 Sebastian Cipolat. All rights reserved.
//

import Foundation


class HomePresenter: MoviesApiListen{
    

    var apiClient:ApiInteractor?;
    var view:HomeView?;

    init() {
         self.apiClient=ApiInteractor();
    }
    
    func setView(home_view:HomeView){
        self.view=home_view;
    }
    
    func getLastMovies(){
        apiClient?.getLastMovies(start_date: "2018-8-22", final_date: "2019-3-30", callback:self)
        
    }
    func detachView(){
    
    }
  
   
    func onMoviesReady(response: Movies) {
        self.view?.onFillList(response: response)
    }
    
    func onError(error: String) {
        
    }
}
