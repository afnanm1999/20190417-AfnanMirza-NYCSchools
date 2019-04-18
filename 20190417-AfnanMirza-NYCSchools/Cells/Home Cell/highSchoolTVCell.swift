//
//  highSchoolTVCell.swift
//  20190417-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 4/17/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class highSchoolTVCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet var cardView: UIView!
    @IBOutlet var schoolNameLbl: UILabel!
    @IBOutlet var addressLbl: UILabel!
    @IBOutlet var websiteLbl: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
     
        cardView.setupCardViewShadows()
    }
    
}
