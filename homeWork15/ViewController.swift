//
//  ViewController.swift
//  homeWork15
//
//  Created by Виталий Крюков on 20.12.2021.
//


import SnapKit
import UIKit

class MainViewController: UIViewController {
    
    var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    let searchBar = UISearchBar()
    
//    var searchBarIsEmpty: Bool {
//        guard let text = searchController.searchBar.text else {return false}
//        return text.isEmpty
//    }
    
    var arrayFilms: [Film] =  []
    
    let api = Api()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .green
        initTableView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "celll")
        
        
        api.delegateFilms = self
        searchController.delegate = self
        searchBar.delegate = self
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search..."
        navigationItem.searchController = searchController
        
        api.request(nameOfFilm: "star")
        
        
    }

    func initTableView() {
       tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), style: .grouped)
    }
}





extension MainViewController: UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UISearchBarDelegate, FilmLoaderDelegate {
    
    func filmsLoaded(films: [Film]) {
        self.arrayFilms = films
        
        tableView.reloadData()
        print(arrayFilms)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        becomeFirstResponder()
        guard let text = searchBar.text else { return}
        api.request(nameOfFilm: text)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celll", for: indexPath ) as! MainTableViewCell
//        cell.headerText.text = Constants.Text.headerText
//        cell.timeAgoText.text = Constants.Text.timeAgoText
//        cell.descriptionText.text = Constants.Text.textDescription
        return cell
    }
    
    
}

 
