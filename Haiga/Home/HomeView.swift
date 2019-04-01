//
//  HomeView.swift
//  Haiga
//
//  Created by Sebastian Cipolat on 31/03/2019.
//  Copyright © 2019 Sebastian Cipolat. All rights reserved.
//

import Foundation

protocol HomeView: NSObjectProtocol {
    func onFillList(response:Movies)
    func onPaginated(response:Movies)
    func onNetworkError(error:String)
    func onError(error:String)
}
