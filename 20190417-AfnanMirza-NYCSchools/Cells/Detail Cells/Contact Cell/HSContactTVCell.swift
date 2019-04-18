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
    
    func setupGestures() {
        let addressLblTapGesture = NYCHighSchoolsTapLabelGesture(target: self, action: #selector(self.tapGestureAction(_:)))
        addressLblTapGesture.type = .address
        addressLblTapGesture.url = self.addressLbl.text!
        self.addressLbl.isUserInteractionEnabled = true
        self.addressLbl.addGestureRecognizer(addressLblTapGesture)
        
        let phoneLblTapGesture = NYCHighSchoolsTapLabelGesture(target: self, action: #selector(tapGestureAction(_:)))
        phoneLblTapGesture.type = .phoneNumber
        phoneLblTapGesture.url = self.phoneLbl.text!
        self.phoneLbl.isUserInteractionEnabled = true
        self.phoneLbl.addGestureRecognizer(phoneLblTapGesture)
        
        let websiteLblTapGesture = NYCHighSchoolsTapLabelGesture(target: self, action: #selector(self.tapGestureAction(_:)))
        websiteLblTapGesture.type = .website
        websiteLblTapGesture.url = self.websiteLbl.text!
        self.websiteLbl.isUserInteractionEnabled = true
        self.websiteLbl.addGestureRecognizer(websiteLblTapGesture)
    }
    
    @objc func tapGestureAction(_ sender: NYCHighSchoolsTapLabelGesture) {
        guard let url = sender.url!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        
        if sender.type == .phoneNumber {
            if let url = URL(string: "tel://\(url)"), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        } else if sender.type == .address {
            if let mapURL = URL(string: "http://maps.apple.com/?address=" + url) {
                UIApplication.shared.open(mapURL)
            }
        } else if sender.type == .website {
            let httpPrefix = "http://"
            
            if var websiteURL = URL(string: url) {
                if !url.contains(httpPrefix) {
                    websiteURL = URL(string: httpPrefix + websiteURL.absoluteString)!
                    
                    UIApplication.shared.open(websiteURL)
                } else {
                    UIApplication.shared.open(websiteURL)
                }
            }
        }
    }
    
}
