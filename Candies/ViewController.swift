//
//  ViewController.swift
//  Candies
//
//  Created by Mehak Bansal on 11/04/21.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    let candies = ["Chocolate Bar","Chocolate Chip","Dark Chocolate","Lollipop","Candy Cane","Jaw Breaker","Caramel","Sour Chew","Gummi Bear"]
    
    
    var searchCandy:[String]!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    @IBOutlet weak var candyTableView: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        candyTableView.dataSource = self
        candyTableView.delegate = self
        searchBar.delegate = self
        
        searchCandy = candies
      
        
    }
    //MARK:- UITableViewDataSourceMethods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return searchCandy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "goToCell" , for: indexPath)
        
        cell.textLabel?.text = searchCandy[indexPath.row]
        
        return cell
    }
    
    
    
    //MARK:- Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "candyView"
        {
            if let cell = sender as? UITableViewCell,
               let indexPath = candyTableView.indexPath(for: cell),
               let productVC = segue.destination as? DetailViewController{
                productVC.detailCandy = searchCandy[indexPath.row]
                productVC.candyImg = searchCandy[indexPath.row]
                
            }
        }
        
    }
    
}


extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        searchCandy = []
        
        if searchText == "" {
            searchCandy = candies
            
        }
        else {
            for candy in candies{
                
                if candy.lowercased().contains(searchText.lowercased()) {
                    searchCandy.append(candy)
                    
                }
            }
        }
        
        self.candyTableView.reloadData()
       
    }
    
    
    
}
