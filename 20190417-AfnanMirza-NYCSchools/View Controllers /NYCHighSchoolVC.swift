//
//  NYCHighSchoolVC.swift
//  20190417-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 4/17/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

enum xibCellNames: String {
    case highSchoolTVCell
}

class NYCHighSchoolVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    
    let cellIdentifier: String = "hsCell"
    let viewModel: NYCHighSchoolsViewModel = NYCHighSchoolsViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.fetchSchoolsInfo(success: { [weak self] _ in
            self?.tableView.reloadData()
        }) { (error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Functions
    func setupSearchController(){
        let searchController = viewModel.searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Schools"
        searchController.searchBar.tintColor = UIColor.white
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func setupTableView() {
        self.tableView.tableFooterView = UIView()
        
        let highSchoolTVCellNib = UINib(nibName: xibCellNames.highSchoolTVCell.rawValue, bundle: nil)
        self.tableView.register(highSchoolTVCellNib, forCellReuseIdentifier: cellIdentifier)
    }
    
}

extension NYCHighSchoolVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: highSchoolTVCell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! highSchoolTVCell
        viewModel.configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailsNavigationController = storyboard.instantiateViewController(withIdentifier: "detailsVC") as? UINavigationController {
            if let detailsVC = detailsNavigationController.viewControllers.first as? NYCHighSchoolDetailsVC {
                detailsVC.viewModel.nycSchools = viewModel.getObject(at: indexPath)
            }
            
            self.present(detailsNavigationController, animated: true, completion: nil)
        }
    }
}

extension NYCHighSchoolVC: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.filterContentForSearchText(searchController.searchBar.text!) {
            self.tableView.reloadData()
        }
    }
}
