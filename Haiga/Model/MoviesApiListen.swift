//
//  MoviesApiListen.swift
//  Haiga
//
//  Created by Sebastian Cipolat on 31/03/2019.
//  Copyright © 2019 Sebastian Cipolat. All rights reserved.
//
import Foundation

protocol MoviesApiListen {
    func onMoviesReady(response:Movies)
    func onError(error:String)
}
