//
//  WeatherService.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 08.01.2026.
//

import Foundation

class WeatherService {
    private let apiKey: String = {
        guard let key = Bundle.main.object(
            forInfoDictionaryKey: "WeatherAPIKey"
        ) as? String else {
            fatalError("API Key not found in Info.plist")
        }
        return key
    }()
    
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    func getWeather(city: String = "kyiv") async throws -> WeatherResponse {

        var components = URLComponents(string: baseURL)
        components?.queryItems = [
            .init(name: "q", value: city),
            .init(name: "units", value: "metric"),
            .init(name: "appid", value: apiKey)
        ]

        guard let url = components?.url else {
            throw WeatherError.invalidURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let http = response as? HTTPURLResponse else {
                throw WeatherError.unknown
            }

            switch http.statusCode {
            case 200:
                break
            case 401:
                throw WeatherError.unauthorized
            case 404:
                throw WeatherError.cityNotFound
            case 500...599:
                throw WeatherError.serverError
            default:
                throw WeatherError.unknown
            }

            do {
                return try JSONDecoder().decode(WeatherResponse.self, from: data)
            } catch {
                throw WeatherError.decodingError
            }

        } catch let error as URLError {
            switch error.code {
            case .notConnectedToInternet, .timedOut:
                throw WeatherError.noInternet
            default:
                throw WeatherError.unknown
            }
        }
    }
}
