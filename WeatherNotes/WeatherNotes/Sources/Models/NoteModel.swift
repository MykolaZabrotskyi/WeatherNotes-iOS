//
//  NoteModel.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 09.01.2026.
//

import Foundation

struct NoteModel: Identifiable, Codable {
    var id = UUID()
    let title: String
    let description: String
    let weatherDescription: String
    let location: String
    let temperature: String
    let icon: String 
    let date: Date
}
