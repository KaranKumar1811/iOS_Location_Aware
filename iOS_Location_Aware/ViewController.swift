//
//  ViewController.swift
//  iOS_Location_Aware
//
//  Created by MacStudent on 2020-01-09.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController,CLLocationManagerDelegate {
   
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var longLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    
    @IBOutlet weak var altitudeLbl: UILabel!
    @IBOutlet weak var courseLbl: UILabel!
    @IBOutlet weak var latLbl: UILabel!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        latLbl.text = String(location.coordinate.latitude)
        longLbl.text = String(location.coordinate.longitude)
        speedLbl.text = String(location.speed)
        altitudeLbl.text = String(location.altitude)
        
        
        
        CLGeocoder().reverseGeocodeLocation(userlocation){
                  (placemark,error) in
                  if let error = error {
                      print(error)
                  }
                  else{
                      if let placemarks = placemark?[0]{
                          var subThoroufare = ""
                          if placemarks.subThoroughfare != nil
                          {
                              subThoroufare = placemarks.subThoroughfare!
                          }
                           var thoroufare = ""
                          if placemarks.thoroughfare != nil{
                              thoroufare = placemarks.thoroughfare!
                          }
                          var subLocality = ""
                          if placemarks.subLocality != nil{
                              subLocality = placemarks.subLocality!
                          }
                          var subAdministrativeArea=""
                          if placemarks.subAdministrativeArea != nil{
                              subAdministrativeArea = placemarks.subAdministrativeArea!
                          }
                          var postalCode = ""
                           if placemarks.postalCode != nil
                                 {
                                   postalCode=placemarks.postalCode!
                                 }
                                  
                          var country=""
                                 if placemarks.country != nil
                                 {
                                   country=placemarks.country!
                                 }
                                  
                        
                      }
                  }
              }
              
          
        
        
        
    }

}

