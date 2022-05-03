//
//  NetworkCode.swift
//  Weather365
//
//  Created by Xiao Huang on 4/3/22.
//
import UIKit
import SwiftyJSON
import Alamofire
import PromiseKit
import SwiftSpinner

extension ViewController{
    func getLocationData (_ url : String) -> Promise<LocationEntity>{
        return Promise<LocationEntity> { seal -> Void in
            AF.request(url).responseJSON { response in
                if response.error != nil{
                    seal.reject(response.error!)
                }
                
                let location = LocationEntity()
                //get data here
                let temp = JSON(response.data!)
                location.key = temp["Key"].stringValue
                location.city = temp["EnglishName"].stringValue
                location.state = temp["AdministrativeArea"]["EnglishName"].stringValue
                location.country = temp["Country"]["EnglishName"].stringValue
                seal.fulfill(location)
                //fulfilling data here
            }
            
        }
    }
    
    func getCurrentWeather (_ url : String) -> Promise<CurrentWeatherEntity>{
        return Promise<CurrentWeatherEntity> { seal -> Void in
            AF.request(url).responseJSON { response in
                if response.error != nil{
                    seal.reject(response.error!)
                }
                
                let currentWeather = CurrentWeatherEntity()
                //get data here
                let temp = JSON(response.data!).arrayValue.first!
                
                currentWeather.text = temp["WeatherText"].stringValue
                currentWeather.icon = temp["WeatherIcon"].intValue
                currentWeather.isDay = temp["IsDayTime"].boolValue
                currentWeather.temp = temp["Temperature"]["Imperial"]["Value"].intValue
                seal.fulfill(currentWeather)
                //fulfilling data here
            }
            
        }
    }
}
