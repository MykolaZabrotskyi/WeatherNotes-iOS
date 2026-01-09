//
//  WeatherViewModel.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 09.01.2026.
//

import SwiftUI
import Combine

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherResponse?
    @Published var errorMessage: String?
    @Published var noteTitle: String = ""
    @Published var noteDescription: String = "Description"
    
    private let service = WeatherService()
    private let notesStorage = NotesStorage()
    
    var cityName: String {
        weather?.name ?? "Unknown"
    }
    
    var temperatureString: String {
        guard let temp = weather?.main.temp else {
            return "--"
        }
        return String(format: "%.1f°C", temp)
    }
    
    var descriptionString: String {
        guard let description = weather?.weather.first?.description else {
            return ""
        }
        return description
    }
    
    var systemIcon: String {
        guard let iconCode = weather?.weather.first?.icon else {
            return "questionmark.circle"
        }
        return WeatherIcon(rawValue: iconCode)?.systemImageName ?? "questionmark.circle"
    }
    
    func buttonIsTapped() {
        Task {
            await fetchWeather()
            if errorMessage == nil {
                let note: NoteModel = NoteModel(
                    title: noteTitle,
                    description: noteDescription,
                    weatherDescription: descriptionString,
                    location: cityName,
                    temperature: temperatureString,
                    icon: systemIcon,
                    date: Date()
                )
                notesStorage.add(note)
            }
        }
    }
    
    private func fetchWeather() async {
        do {
            weather = try await service.getWeather(city: "kyiv")
            errorMessage = nil
        } catch let error as WeatherError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "Unexpected error"
        }
    }
}
