//
//  NoteDetailsView.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 09.01.2026.
//

import SwiftUI

struct NoteDetailsView: View {
    let note: NoteModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(note.location)
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundStyle(Metrics.Colors.primaryIndigo)
                        HStack {
                            VStack(alignment: .leading) {
                                Text(note.weatherDescription)
                                    .fontWeight(.semibold)
                                    .font(Font.system(size: 30))
                                    .foregroundStyle(Color.indigo)
                                    .lineLimit(1)
                                HStack {
                                    Text(note.date.formatted(date: .abbreviated, time: .shortened))
                                        .fontWeight(Metrics.WeatherFrame.fontWeight)
                                        .font(Font.system(size: Metrics.WeatherFrame.fontSize))
                                        .foregroundStyle(Metrics.WeatherFrame.color)
                                    Text("|")
                                        .fontWeight(Metrics.WeatherFrame.fontWeight)
                                        .font(Font.system(size: Metrics.WeatherFrame.fontSize))
                                        .foregroundStyle(Metrics.WeatherFrame.color)
                                    Text(note.temperature)
                                        .fontWeight(Metrics.WeatherFrame.fontWeight)
                                        .font(Font.system(size: Metrics.WeatherFrame.fontSize))
                                        .foregroundStyle(Metrics.WeatherFrame.color)
                                } // HStack
                            } // VStack
                            Spacer()
                            HStack {
                                Image(systemName: note.icon)
                                    .symbolRenderingMode(.hierarchical)
                                    .foregroundStyle(Color.indigo)
                                    .font(Font.system(size: Metrics.WeatherFrame.Image.fontSize))
                            } // HStack
                            .frame(width: Metrics.WeatherFrame.Image.sideLength,
                                   height: Metrics.WeatherFrame.Image.sideLength)
                        } // HStack
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(Metrics.Colors.primaryIndigo)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: Metrics.cornerRadius)
                                .fill(Metrics.Colors.primaryIndigo.opacity(0.08))
                        )
                    } // VStack
                    
                    Divider()
                        .padding(.vertical, 8)
    
                    VStack(alignment: .leading, spacing: 16) {
                        Text(note.title)
                            .font(.title2.bold())
                            .foregroundStyle(Color.black)
                        
                        Text(note.description)
                            .font(.body)
                            .foregroundStyle(Metrics.Colors.secondaryText)
                            .lineSpacing(6)
                    } // VStack
                } // VStack
                .padding(24)
            } // ScrollView
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Note details")
                        .font(Font.system(
                            size: Metrics.Title.fontSize,
                            weight: Metrics.Title.fontWeight)
                        )
                        .foregroundStyle(Metrics.Title.color)
                        .padding(.horizontal, Metrics.Title.Frame.horizontalPadding)
                        .padding(.vertical, Metrics.Title.Frame.verticalPadding)
                        .background(
                            RoundedRectangle(cornerRadius: Metrics.cornerRadius)
                                .fill(Metrics.Title.Frame.color)
                        )
                        .padding(.leading, 30)
                } // ToolbarItem
                ToolbarItem(placement: .automatic) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .padding(.horizontal, 15)
                    .foregroundStyle(Metrics.Buttons.activeColor)
                    .font(Font.system(
                        size: Metrics.Buttons.fontSize,
                        weight: Metrics.Buttons.fontWeight)
                    )
                } // ToolbarItem
            } // toolbar
        } // NavigationStack
    }
}

private enum Metrics {
    enum Colors {
        static let primaryIndigo: Color = .indigo
        static let secondaryText: Color = .gray
    }
    
    enum WeatherFrame {
        static let fontSize = 20.0
        static let fontWeight: Font.Weight = .light
        static let color: Color = .gray
        enum Image {
            static let color: Color = .indigo
            static let fontSize = 40.0
            static let sideLength = 60.0
        }
    }
    
    enum Title {
        static let fontSize = 30.0
        static let fontWeight: Font.Weight = .semibold
        static let color: Color = .white
        enum Frame {
            static let horizontalPadding = 18.0
            static let verticalPadding = 8.0
            static let color: Color = .indigo
        }
    }
    
    enum Buttons {
        static let fontSize = 25.0
        static let fontWeight: Font.Weight = .regular
        static let activeColor: Color = .indigo
        static let pasiveColor: Color = .gray
    }
    
    static let cornerRadius = 20.0
}

#Preview {
    NoteDetailsView(note: NoteModel(
        title: "Evening walk",
        description: "We spontaneously decided to walk around the center. The city looks completely different when the lights come on. We stopped in for coffee and discussed plans for the weekend. It was cool, but very atmospheric.",
        weatherDescription: "overcast clouds",
        location: "Kyiv",
        temperature: "12°C",
        icon: "moon.stars.fill",
        date: Date()
    ))
}
