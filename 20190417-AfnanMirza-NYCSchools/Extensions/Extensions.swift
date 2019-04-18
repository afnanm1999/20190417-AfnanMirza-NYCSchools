//
//  Extensions.swift
//  20190417-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 4/17/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation
import UIKit

extension String {
    /// This function will fetch the address without coodinates
    ///
    /// - Returns: Stirng, address of the high school
    func getCompleteAddressWithoutCoordinate() -> String {
        let address = self.components(separatedBy: "(")
        return address[0]
    }
}
