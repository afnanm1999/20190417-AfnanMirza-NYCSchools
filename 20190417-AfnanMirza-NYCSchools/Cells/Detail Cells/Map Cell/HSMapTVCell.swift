//
//  HSMapTVCell.swift
//  20190417-AfnanMirza-NYCSchools
//
//  Created by Afnan Mirza on 4/18/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import UIKit
import MapKit

class HSMapTVCell: UITableViewCell {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.setupCardViewShadows()
        mapView.layer.cornerRadius = cardView.layer.cornerRadius
    }
    
    func addHSAnnotaionWithCoordinates(_ hsCoordinates: CLLocationCoordinate2D){
        let highSchoolAnnotation = MKPointAnnotation()
        highSchoolAnnotation.coordinate = hsCoordinates
        self.mapView.addAnnotation(highSchoolAnnotation)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: highSchoolAnnotation.coordinate, span: span)
        let adjustRegion = self.mapView.regionThatFits(region)
        self.mapView.setRegion(adjustRegion, animated:true)
    }
    
}
