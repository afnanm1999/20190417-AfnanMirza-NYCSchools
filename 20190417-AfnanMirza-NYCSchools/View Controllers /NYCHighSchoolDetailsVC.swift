//
//  NYCHighSchoolDetailsVC.swift
//  20190417-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 4/18/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class NYCHighSchoolDetailsVC: UIViewController {
    
    @IBOutlet var cancelBtn: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    let viewModel: NYCHighSchoolsDetailsViewModel = NYCHighSchoolsDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let highSchoolTVCellNib = UINib(nibName: xibCellNames.highSchoolTVCell.rawValue, bundle: nil)
        self.tableView.register(highSchoolTVCellNib, forCellReuseIdentifier: "hsCell")
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension NYCHighSchoolDetailsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: highSchoolTVCell = self.tableView.dequeueReusableCell(withIdentifier: "hsCell", for: indexPath) as! highSchoolTVCell
        cell.schoolNameLbl.text = viewModel.nycSchools?.schoolName!
        return cell
    }
}
