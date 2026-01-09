//
//  NoteCard.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 08.01.2026.
//

import SwiftUI

struct NoteCard: View {
    let note: NoteModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(note.title)
                    .fontWeight(Metrics.Title.fontWeight)
                    .font(Font.system(size: Metrics.Title.fontSize))
                    .foregroundStyle(Metrics.Title.color)
                    .lineLimit(1)
                HStack {
                    Text(note.date.formatted(date: .abbreviated, time: .shortened))
                        .fontWeight(Metrics.Date.fontWeight)
                        .font(Font.system(size: Metrics.Date.fontSize))
                        .foregroundStyle(Metrics.Date.color)
                    Text("|")
                        .fontWeight(Metrics.Date.fontWeight)
                        .font(Font.system(size: Metrics.Date.fontSize))
                        .foregroundStyle(Metrics.Date.color)
                    Text(note.temperature)
                        .fontWeight(Metrics.Date.fontWeight)
                        .font(Font.system(size: Metrics.Date.fontSize))
                        .foregroundStyle(Metrics.Date.color)
                } // HStack
            } // VStack
            Spacer()
            HStack {
                Image(systemName: note.icon)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(Metrics.Image.color)
                    .font(Font.system(size: Metrics.Image.fontSize))
            } // HStack
            .frame(width: Metrics.Image.sideLength, height: Metrics.Image.sideLength)
            .background(
                RoundedRectangle(cornerRadius: Metrics.cornerRadius)
                    .fill(Color.indigo)
            )
        } // HStack
        .frame(width: Metrics.frameWidth)
    }
}

private enum Metrics {
    enum Title {
        static let fontSize = 25.0
        static let fontWeight: Font.Weight = .semibold
        static let color: Color = .indigo
    }
    
    enum Date {
        static let fontSize = 18.0
        static let fontWeight: Font.Weight = .light
        static let color: Color = .gray
    }
    
    enum Image {
        static let color: Color = .white
        static let fontSize = 40.0
        static let sideLength = 70.0
    }
    
    static let frameWidth = 330.0
    
    static let cornerRadius = 20.0
}

#Preview {
    NoteCard(note: NoteModel(
        title: "Тестова нотатка",
        description: "Опис",
        weatherDescription: "Хмарно",
        location: "Львів",
        temperature: "6°C",
        icon: "cloud.fill",
        date: Date()
    ))
}
