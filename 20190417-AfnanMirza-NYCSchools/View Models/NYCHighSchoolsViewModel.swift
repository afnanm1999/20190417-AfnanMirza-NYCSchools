//
//  NYCHighSchoolsViewModel.swift
//  20190417-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 4/17/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation
import UIKit

class NYCHighSchoolsViewModel {
    
    // MARK: - Properties
    let searchController = UISearchController(searchResultsController: nil)
    
    var nycSchoolsList: [NYCHighSchools]
    var filteredNycHSList: [NYCHighSchools]
    
    // MARK: - Initializer
    init() {
        nycSchoolsList = [NYCHighSchools]()
        filteredNycHSList = [NYCHighSchools]()
    }
    
    // MARK: - Functions / Methods
    func fetchSchoolsInfo(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        DispatchQueue.global(qos: .background).async {
            BackendAPI.fetchNYCHighSchoolInfo(success: { (hsObjectArr) in
                if let nycHSList = hsObjectArr as? [NYCHighSchools] {
                    self.nycSchoolsList = nycHSList
                    
                    self.fetchSchoolsSATInfo(success: { _ in
                        DispatchQueue.main.async {
                            success(self.nycSchoolsList)
                        }
                    }, failure: failure)
                }
            }, failure: failure)
        }
    }
    
    private func fetchSchoolsSATInfo(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        DispatchQueue.global(qos: .background).async {
            BackendAPI.fetchNYCHighSchoolSATInfo(success: { (hsSATObjectArr) in
                guard let highSchoolsWithSatScoreArr = hsSATObjectArr as? [[String: Any]] else {
                    return
                }
                
                for  highSchoolsWithSatScore in highSchoolsWithSatScoreArr {
                    if let matchedDBN = highSchoolsWithSatScore["dbn"] as? String {
                        //This will get the High School with the Common DBN
                        
                        self.nycSchoolsList.forEach({ (nycHighSchool) in
                            if nycHighSchool.dbn == matchedDBN {
                                nycHighSchool.appendSATData(schoolSATInfoJSON: highSchoolsWithSatScore)
                            }
                        })
                        
                        success(self.nycSchoolsList)
                    }
                }
                
            }, failure: failure)
        }
    }

    func getNumberOfRows() -> Int {
        if isFiltering() {
            return filteredNycHSList.count
        }
        
        return nycSchoolsList.count
    }
    
    func getObject(at indexPath: IndexPath) -> NYCHighSchools {
        if isFiltering() {
            return filteredNycHSList[indexPath.row]
        }
        
        return nycSchoolsList[indexPath.row]
    }
    
    func configureCell(cell: highSchoolTVCell, indexPath: IndexPath) {
        var maindata: NYCHighSchools
        
        if isFiltering() {
            maindata = filteredNycHSList[indexPath.row]
        } else {
            maindata = nycSchoolsList[indexPath.row]
        }
        
        cell.schoolNameLbl.text = maindata.schoolName!
        cell.addressLbl.text = maindata.schoolAddress?.getCompleteAddressWithoutCoordinate()
        cell.websiteLbl.text = maindata.schoolWebsite!
    }
    
    // MARK: - UISearchController Helpers
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, completion: () -> Void) {
        filteredNycHSList = nycSchoolsList.filter({ (schools) -> Bool in
            return schools.schoolName!.lowercased().contains(searchText.lowercased())
        })
        
        completion()
    }
    
}
