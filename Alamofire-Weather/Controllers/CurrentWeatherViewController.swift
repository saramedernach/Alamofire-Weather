//
//  CurrentWeatherViewController.swift
//  Alamofire-Weather
//
//  Created by Sara Medernach on 5/5/20.
//  Copyright © 2020 Duc Tran. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {
    
    @IBOutlet weak var cityTextLabel: UILabel!
    
    @IBOutlet weak var temperatureScaleLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    let forecastAPIKey = "33c371344898311931ea3058dcc4730f"
    let coordinate: (lat: Double, long: Double) = (37.8267,-122.4233)
    var forecastService: ForecastService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getCurrentWeather(latitude: coordinate.lat, longitude: coordinate.long) { (currentWeather) in
                
            if let currentWeather = currentWeather {
                    
                DispatchQueue.main.async {
                    
                    if let temperature = currentWeather.temperature {
                        
                        self.temperatureLabel.text = "\(temperature)º"
                        
                    }
                    else {
                        
                        self.temperatureLabel.text = "-"
                        
                    }
                    
                }
            }
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
