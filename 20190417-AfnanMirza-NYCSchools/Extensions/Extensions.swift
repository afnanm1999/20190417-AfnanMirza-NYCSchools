//
//  Extensions.swift
//  20190417-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 4/17/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation
import UIKit
import MapKit

enum XIBCellNames: String {
    case highSchoolTVCell
    
    enum Details: String {
        case HSSATScoresTVCell
        case HSOverviewTVCell
        case HSContactTVCell
        case HSMapTVCell
    }
}

enum CellIdentifiers: String {
    case hsCell
    
    enum DetailsCellIdentifiers: String {
        case satScoresCell
        case overviewCell
        case contactCell
        case mapCell
    }
}

enum ContactLabelTypes: String {
    case address
    case phoneNumber
    case website
}

extension String {
    func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
    
    /// This function will fetch the address without coodinates
    ///
    /// - Returns: Stirng, address of the high school
    func getCompleteAddressWithoutCoordinate() -> String {
        let address = self.components(separatedBy: "(")
        return address[0]
    }
    
    /// This function will fetch the coodinates for the selected High School location
    ///
    /// - Returns: CLLocationCoordinate2D, coodinate of High School location
    func getCoodinateForSelectedHighSchool() -> CLLocationCoordinate2D? {
        let coordinateString = self.slice(from: "(", to: ")")
        let coordinates = coordinateString?.components(separatedBy: ",")
        if let coordinateArray = coordinates {
            let latitude = (coordinateArray[0] as NSString).doubleValue
            let longitude = (coordinateArray[1] as NSString).doubleValue
            return CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
        }
        return nil
    }
}

extension UIView {
    func setupCardViewShadows(){
        let view = self
        view.layer.cornerRadius = 10.0
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.6).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowOpacity = 0.8
        view.layer.shadowRadius = 5
        view.layer.masksToBounds = false
    }
}

