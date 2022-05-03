//
//  ViewController.swift
//  Weather365
//
//  Created by Xiao Huang on 4/3/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController{
    let cities = ["Current Location","Seattle","Portland","London","Delhi","Shanghai"]
    let locationManager = CLLocationManager()
    @IBOutlet var tblView: UITableView!
    
    var citiesModel : [CurrentWeatherEntity]
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
    
}

