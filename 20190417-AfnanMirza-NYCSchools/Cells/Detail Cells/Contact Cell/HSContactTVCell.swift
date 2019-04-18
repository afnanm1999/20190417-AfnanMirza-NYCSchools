//
//  HSContactTVCell.swift
//  20190417-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 4/18/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class HSContactTVCell: UITableViewCell {

    @IBOutlet var cardView: UIView!
    
    @IBOutlet var addressLbl: UILabel!
    @IBOutlet var phoneLbl: UILabel!
    @IBOutlet var websiteLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.setupCardViewShadows()
    }
    
}
