//
//  ImageConvert.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 09.01.2026.
//

import Foundation

enum WeatherIcon: String {
    case clearDay = "01d"
    case clearNight = "01n"

    case fewCloudsDay = "02d"
    case fewCloudsNight = "02n"

    case cloudsDay = "03d"
    case cloudsNight = "03n"
    case overcastDay = "04d"
    case overcastNight = "04n"

    case showerRainDay = "09d"
    case showerRainNight = "09n"

    case rainDay = "10d"
    case rainNight = "10n"

    case thunderstormDay = "11d"
    case thunderstormNight = "11n"

    case snowDay = "13d"
    case snowNight = "13n"

    case mistDay = "50d"
    case mistNight = "50n"

    /// System SF Symbol name
    var systemImageName: String {
        switch self {
        case .clearDay:
            return "sun.max.fill"
        case .clearNight:
            return "moon.stars.fill"

        case .fewCloudsDay:
            return "cloud.sun.fill"
        case .fewCloudsNight:
            return "cloud.moon.fill"

        case .cloudsDay, .cloudsNight,
             .overcastDay, .overcastNight:
            return "cloud.fill"

        case .showerRainDay, .showerRainNight:
            return "cloud.drizzle.fill"

        case .rainDay:
            return "cloud.sun.rain.fill"
        case .rainNight:
            return "cloud.moon.rain.fill"

        case .thunderstormDay, .thunderstormNight:
            return "cloud.bolt.rain.fill"

        case .snowDay, .snowNight:
            return "snowflake"

        case .mistDay, .mistNight:
            return "cloud.fog.fill"
        }
    }
}

