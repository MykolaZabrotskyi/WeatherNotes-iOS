//
//  WeatherResponse.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 09.01.2026.
//

import Foundation

struct WeatherResponse: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
    
    struct Main: Codable {
        let temp: Double
    }
    
    struct Weather: Codable{
        let description: String
        let icon: String
    }
}
