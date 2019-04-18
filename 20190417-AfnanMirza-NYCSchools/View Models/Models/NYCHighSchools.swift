//
//  NYCHighSchools.swift
//  20190417-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 4/17/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit

class NYCHighSchools: NSObject {
    var dbn: String?
    var schoolName: String?
    var overviewParagraph: String?
    var schoolAddress: String?
    var schoolWebsite: String?
    var schoolTelephoneNumber: String?
    
    var satCriticalReadingAvgScore: String?
    var satMathAvgScore: String?
    var satWritinAvgScore: String?
    
    init(schoolInfoJSON: [String: Any]) {
        if let dbnObject = schoolInfoJSON["dbn"] as? String {
            self.dbn = dbnObject
        }
        
        if let schoolNameOnject = schoolInfoJSON["school_name"] as? String {
            self.schoolName = schoolNameOnject
        }
        
        if let overviewParagraphObject = schoolInfoJSON["overview_paragraph"] as? String {
            self.overviewParagraph = overviewParagraphObject
        }
        
        if let schoolAddressObject = schoolInfoJSON["location"] as? String {
            self.schoolAddress = schoolAddressObject
        }
        
        if let schoolTelObject = schoolInfoJSON["phone_number"] as? String {
            self.schoolTelephoneNumber = schoolTelObject
        }
        
        if let websiteObject = schoolInfoJSON["website"] as? String {
            self.schoolWebsite = websiteObject
        }
    }
    
    // Separate function because we need to append the SAT info.
    func appendSATData(schoolSATInfoJSON: [String: Any]) {
        if let satReadingScoreObject =  schoolSATInfoJSON["sat_critical_reading_avg_score"] as? String {
            self.satCriticalReadingAvgScore = satReadingScoreObject
        }
        
        if let satMathScoreObject = schoolSATInfoJSON["sat_math_avg_score"] as? String {
            self.satMathAvgScore = satMathScoreObject
        }
        
        if let satWritingScoreObject =  schoolSATInfoJSON["sat_writing_avg_score"] as? String {
            self.satWritinAvgScore = satWritingScoreObject
        }
    }
}
