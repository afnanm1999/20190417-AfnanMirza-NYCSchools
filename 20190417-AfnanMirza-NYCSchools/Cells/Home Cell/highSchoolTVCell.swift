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
     
        setupCardViewShadows()
    }
    
    func setupCardViewShadows(){
        let view = cardView
        view?.layer.cornerRadius = 10.0
        view?.layer.shadowColor = UIColor.black.withAlphaComponent(0.6).cgColor
        view?.layer.shadowOffset = CGSize(width: 0, height: 3)
        view?.layer.shadowOpacity = 0.8
        view?.layer.shadowRadius = 5
        view?.layer.masksToBounds = false
    }
    
}
