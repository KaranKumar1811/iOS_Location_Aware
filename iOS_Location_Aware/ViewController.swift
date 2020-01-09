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
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        latLbl.text = String(location.coordinate.latitude)
        longLbl.text = String(location.coordinate.longitude)
        speedLbl.text = String(location.speed)
        altitudeLbl.text = String(location.altitude)
        
        
        
        CLGeocoder().reverseGeocodeLocation(location){
                  (placemark,error) in
                  if let error = error {
                      print(error)
                  }
                  else{
                      if let placemarks = placemark?[0]{
                          var address = ""
                          if placemarks.subThoroughfare != nil
                          {
                              address += placemarks.subThoroughfare! + "\n"
                          }
                           
                          if placemarks.thoroughfare != nil{
                              address += placemarks.thoroughfare! + "\n"
                          }
                         
                          if placemarks.subLocality != nil{
                              address += placemarks.subLocality! + "\n"
                          }
                          
                          if placemarks.subAdministrativeArea != nil{
                              address += placemarks.subAdministrativeArea! + "\n"
                          }
                    
                           if placemarks.postalCode != nil
                                 {
                                   address+=placemarks.postalCode! + "\n"
                                 }
                        if placemarks.country != nil
                                            {
                                                address+=placemarks.country!
                                            }
                                self.addressLbl.text = address
                          
                                  
                        
                      }
                  }
              }
              
          
        
        
        
    }

}

