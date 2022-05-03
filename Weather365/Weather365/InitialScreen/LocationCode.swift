//
//  LocationCode.swift
//  Weather365
//
//  Created by Xiao Huang on 4/3/22.
//

import CoreLocation

extension ViewController : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error! \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        print(lat)
        print(lng)
        let url = "\(locationApiURL)\(lat)%2C\(lng)"
        getLocationData(url)
                    .done { location in
                        print(location.key)
                        print(location.city)
                        print(location.state)
                        print(location.country)
                        
                        let url = "\(currentConditionSplice)\(location.key)?apikey=\(apiKey)"
                        self.getCurrentWeather(url)
                            .done { currentWeather in
                                print(currentWeather.text)
                                print(currentWeather.icon)
                                print(currentWeather.isDay)
                                print(currentWeather.temp)
                            }.catch { error in
                                print(error.localizedDescription)
                            }
                    }
                    .catch { error in
                        print(error.localizedDescription)
                    }
        
    }
}
