//
//  ViewController.swift
//  Haiga
//
//  Created by Sebastian Cipolat on 30/03/2019.
//  Copyright © 2019 Sebastian Cipolat. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, HomeView{
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var loadingView: UIActivityIndicatorView!
    
    var movies: [Movie] = []
    let presenter=HomePresenter()

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseTableViewCell

        cell.fill(data: movies[indexPath.row])
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.setView(home_view: self)
        self.presenter.getLastMovies()
    }
    
    func onFillList(response: Movies) {
        movies=response.results
        self.tableView.reloadData()
        self.loadingView.stopAnimating()
    }
    
    func onPaginated(response: Movies) {
    
    }
    
    func onNetworkError(error: String) {
        self.loadingView.stopAnimating()

    }
    
    func onError(error: String) {
        self.loadingView.stopAnimating()

    }
   
}




