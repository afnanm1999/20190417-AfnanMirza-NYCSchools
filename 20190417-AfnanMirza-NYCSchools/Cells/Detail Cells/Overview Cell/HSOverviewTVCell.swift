//
//  HSOverviewTVCell.swift
//  20190417-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 4/18/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class HSOverviewTVCell: UITableViewCell {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var overViewLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.setupCardViewShadows()
    }
    
}
