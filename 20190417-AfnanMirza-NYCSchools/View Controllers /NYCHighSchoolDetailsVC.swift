//
//  NYCHighSchoolDetailsVC.swift
//  20190417-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 4/18/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class NYCHighSchoolDetailsVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var cancelBtn: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    let viewModel: NYCHighSchoolsDetailsViewModel = NYCHighSchoolsDetailsViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.registerCells(with: self.tableView)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension NYCHighSchoolDetailsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.configureCell(at: indexPath, tableView: self.tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRow(at: indexPath)
    }
}

