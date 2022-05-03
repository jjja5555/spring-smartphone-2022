//
//  ViewController.swift
//  GetLocation
//
//  Created by Xiao Huang on 3/26/22.
//

import UIKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var lblLatitude: UILabel!
    @IBOutlet var lblLongitude: UILabel!
    @IBOutlet var lblAddress: UILabel!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        // Do any additional setup after loading the view.
    }

    @IBAction func getLocation(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error! \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        lblLatitude.text = "Latitude: \(lat)"
        lblLongitude.text = "Longitude: \(lng)"
        print(lat)
        print(lng)
        
        getAddress(location: location)
    }
    
    func getAddress(location : CLLocation){
        let clGeoCode = CLGeocoder()
        clGeoCode.reverseGeocodeLocation(location) { placeMarks, error in
            if(error != nil){
                self.lblAddress.text = "Unable to get address"
                return
            }
            guard let place = placeMarks?[0] else {return}
            var address = ""
            
            if place.name != nil{
                address += place.name! + ", "
            }
            
            if place.subLocality != nil{
                address += place.subLocality! + ", "
            }
            
            if place.locality != nil{
                address += place.locality! + ", "
            }
            
            if place.postalCode != nil{
                address += place.postalCode! + ", "
            }
            
            if place.country != nil{
                address += place.country! + ", "
            }
            
//            if place.region != nil{
//                print("Region: " + place.region!)
//            }
            
            print(address)
            self.lblAddress.text = address
        }
    }
}

