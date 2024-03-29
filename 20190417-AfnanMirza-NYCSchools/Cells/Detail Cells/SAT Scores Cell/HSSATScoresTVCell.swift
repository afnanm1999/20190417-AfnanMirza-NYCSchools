//
//  HSSATScoresTVCell.swift
//  20190417-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 4/18/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class HSSATScoresTVCell: UITableViewCell {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var schoolNameLbl: UILabel!
    @IBOutlet var satReadingScoreLbl: UILabel!
    @IBOutlet var satMathScoreLbl: UILabel!
    @IBOutlet var satWritingScoreLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.setupCardViewShadows()
    }
    
}
