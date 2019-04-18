//
//  NYCHighSchoolsDetailsViewModel.swift
//  20190417-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 4/18/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation
import UIKit
import MapKit

struct DetailCellsConstants {
    static let noSATScoreInfomationText = "There is no SAT score information for this High School"
    static let averageSATReadingScore = "SAT Average Critical Reading Score: "
    static let averageSATMathScore = "SAT Average Math Score: "
    static let averageSATWritingScore = "SAT Average Writing Score: "
}

class NYCHighSchoolsDetailsViewModel {
    
    // MARK: - Properties
    var nycSchools: NYCHighSchools?
    
    // MARK: - Initializer
    init() {
        nycSchools = nil
    }
    
    // MARK: - Functions
    func registerCells(with tableView: UITableView) {
        let highSchoolSATInfoTVCellNib = UINib(nibName: XIBCellNames.Details.HSSATScoresTVCell.rawValue, bundle: nil)
        tableView.register(highSchoolSATInfoTVCellNib, forCellReuseIdentifier: CellIdentifiers.DetailsCellIdentifiers.satScoresCell.rawValue)
        
        let highSchoolOverViewTVCellNib = UINib(nibName: XIBCellNames.Details.HSOverviewTVCell.rawValue, bundle: nil)
        tableView.register(highSchoolOverViewTVCellNib, forCellReuseIdentifier: CellIdentifiers.DetailsCellIdentifiers.overviewCell.rawValue)
        
        let highSchoolContactTVCellNib = UINib(nibName: XIBCellNames.Details.HSContactTVCell.rawValue, bundle: nil)
        tableView.register(highSchoolContactTVCellNib, forCellReuseIdentifier: CellIdentifiers.DetailsCellIdentifiers.contactCell.rawValue)
        
        let highSchoolMapTVCellNib = UINib(nibName: XIBCellNames.Details.HSMapTVCell.rawValue, bundle: nil)
        tableView.register(highSchoolMapTVCellNib, forCellReuseIdentifier: CellIdentifiers.DetailsCellIdentifiers.mapCell.rawValue)
    }
    
    func getNumberOfRows() -> Int {
        return 4
    }
    
    func configureCell(at indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableViewCellWithSATScore(tableView)
        case 1:
            return tableViewCellWithOverView(tableView)
        case 2:
            return tableViewCellWithContactInfo(tableView)
        case 3:
            return tableViewCellWithMap(tableView)
        default:
            return UITableViewCell()
        }
    }
    
    func heightForRow(at indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0, 1, 2:
            return UITableView.automaticDimension
        default:
            return UIScreen.main.bounds.width * 0.7
        }
    }
    
    /// This function get the selected High School name's  average sat scores
    ///
    /// - Returns: UITableViewCell
    func tableViewCellWithSATScore(_ tableView: UITableView) -> UITableViewCell {
        guard let HSWithSatScore = nycSchools else {return UITableViewCell()}
        
        let schoolWithSATScoresCell: HSSATScoresTVCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.DetailsCellIdentifiers.satScoresCell.rawValue) as! HSSATScoresTVCell
        
        schoolWithSATScoresCell.schoolNameLbl.text = HSWithSatScore.schoolName
        
        //For some high school, there is no information of the average SAT score, display the static mesaage to the customers
        schoolWithSATScoresCell.satReadingScoreLbl.text = (HSWithSatScore.satCriticalReadingAvgScore != nil) ? (DetailCellsConstants.averageSATReadingScore + HSWithSatScore.satCriticalReadingAvgScore!) : DetailCellsConstants.noSATScoreInfomationText
        
        // Sets the Math Average Score
        schoolWithSATScoresCell.satMathScoreLbl.isHidden = (HSWithSatScore.satMathAvgScore != nil) ? false : true
        schoolWithSATScoresCell.satMathScoreLbl.text = (HSWithSatScore.satMathAvgScore != nil) ? (DetailCellsConstants.averageSATMathScore + HSWithSatScore.satMathAvgScore!) : nil
        
        // Sets the Writing Average Score
        schoolWithSATScoresCell.satWritingScoreLbl.isHidden =  (HSWithSatScore.satWritinAvgScore != nil) ? false : true
        schoolWithSATScoresCell.satWritingScoreLbl.text = (HSWithSatScore.satWritinAvgScore != nil) ? (DetailCellsConstants.averageSATWritingScore + HSWithSatScore.satWritinAvgScore!) : nil
        
        return schoolWithSATScoresCell
    }
    
    /// This function get the selected high school's overview
    ///
    /// - Returns: UITableViewCell
    func tableViewCellWithOverView(_ tableView: UITableView) -> UITableViewCell{
        guard let maindata = nycSchools else {return UITableViewCell()}
        
        let schoolWithOverviewCell: HSOverviewTVCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.DetailsCellIdentifiers.overviewCell.rawValue) as! HSOverviewTVCell
        
        schoolWithOverviewCell.overViewLbl.text = maindata.overviewParagraph
        
        return schoolWithOverviewCell
    }
    
    /// This function get the high school contact information with address, tel and website.
    ///
    /// - Returns: UITableViewCell
    func tableViewCellWithContactInfo(_ tableView: UITableView) -> UITableViewCell {
        guard let maindata = nycSchools else {return UITableViewCell()}
        
        let schoolWithContactCell: HSContactTVCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.DetailsCellIdentifiers.contactCell.rawValue) as! HSContactTVCell
        
        schoolWithContactCell.addressLbl.text = "Address: " + maindata.schoolAddress!.getCompleteAddressWithoutCoordinate()
        schoolWithContactCell.phoneLbl.text = (maindata.schoolTelephoneNumber != nil) ? "Tel: " + maindata.schoolTelephoneNumber! : ""
        schoolWithContactCell.websiteLbl.text = (maindata.schoolWebsite != nil) ? "Website: " + maindata.schoolWebsite! : ""
        schoolWithContactCell.setupGestures()
        
        return schoolWithContactCell
    }
    
    /// This function get the High School's location with annotaion on the map
    ///
    /// - Returns: UITableViewCell
    func tableViewCellWithMap(_ tableView: UITableView) -> UITableViewCell{
        guard let maindata = nycSchools else {return UITableViewCell()}
        
        let schoolWithAddressCell: HSMapTVCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.DetailsCellIdentifiers.mapCell.rawValue) as! HSMapTVCell
        
        if let highSchoolCoordinate = maindata.schoolAddress?.getCoodinateForSelectedHighSchool() {
            //            schoolWithAddressCell.addHSAnnotaionWithCoordinates(highSchoolCoordinate)
            let highSchoolAnnotation = MKPointAnnotation()
            highSchoolAnnotation.coordinate = highSchoolCoordinate
            schoolWithAddressCell.mapView.addAnnotation(highSchoolAnnotation)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
            let region = MKCoordinateRegion(center: highSchoolAnnotation.coordinate, span: span)
            let adjustRegion = schoolWithAddressCell.mapView.regionThatFits(region)
            schoolWithAddressCell.mapView.setRegion(adjustRegion, animated:true)
            
        }
        
        return schoolWithAddressCell
    }
    
}
