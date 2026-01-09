//
//  WeatherError.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 09.01.2026.
//

import Foundation

enum WeatherError: LocalizedError {
    case invalidURL
    case noInternet
    case cityNotFound
    case unauthorized
    case serverError
    case decodingError
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid request URL."
        case .noInternet:
            return "No internet connection."
        case .cityNotFound:
            return "City not found."
        case .unauthorized:
            return "Invalid API key."
        case .serverError:
            return "Server error. Please try later."
        case .decodingError:
            return "Failed to process server response."
        case .unknown:
            return "Something went wrong."
        }
    }
}
