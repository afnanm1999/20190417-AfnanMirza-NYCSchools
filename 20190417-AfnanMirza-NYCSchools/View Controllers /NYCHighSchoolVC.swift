//
//  NYCHighSchoolVC.swift
//  20190417-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 4/17/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class NYCHighSchoolVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    
    let viewModel: NYCHighSchoolsViewModel = NYCHighSchoolsViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.setupSearchController(vc: self, navigationItem: self.navigationItem)
        viewModel.setupTableView(tableView: self.tableView)
        viewModel.searchController.searchResultsUpdater = self
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
}

extension NYCHighSchoolVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.tableViewHighSchoolBasicCell(tableView: tableView, indexPath: indexPath)
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

class NYCHighSchoolsTapLabelGesture: UITapGestureRecognizer {
    var url: String?
    var type: ContactLabelTypes?
    
}
