//
//  NoteCard.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 08.01.2026.
//

import SwiftUI

struct NoteCard: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Title title title title")
                    .fontWeight(Metrics.Title.fontWeight)
                    .font(Font.system(size: Metrics.Title.fontSize))
                    .foregroundStyle(Metrics.Title.color)
                HStack {
                    Text("Date date date")
                        .fontWeight(Metrics.Date.fontWeight)
                        .font(Font.system(size: Metrics.Date.fontSize))
                        .foregroundStyle(Metrics.Date.color)
                    Text("|")
                        .fontWeight(Metrics.Date.fontWeight)
                        .font(Font.system(size: Metrics.Date.fontSize))
                        .foregroundStyle(Metrics.Date.color)
                    Text("6*C")
                        .fontWeight(Metrics.Date.fontWeight)
                        .font(Font.system(size: Metrics.Date.fontSize))
                        .foregroundStyle(Metrics.Date.color)
                }
            } // VStack
            HStack {
                Image(systemName: "cloud.fill")
                    .foregroundStyle(Color.white)
                    .font(Font.system(size: Metrics.Image.fontSize))
            }
            .frame(width: Metrics.Image.sideLength, height: Metrics.Image.sideLength)
            .background(
                RoundedRectangle(cornerRadius: Metrics.cornerRadius)
                    .fill(Color.indigo)
            )
        } // HStack
    }
}

private enum Metrics {
    enum Title {
        static let fontSize = 25.0
        static let fontWeight: Font.Weight = .semibold
        static let color: Color = .indigo
    }
    
    enum Date {
        static let fontSize = 20.0
        static let fontWeight: Font.Weight = .light
        static let color: Color = .gray
    }
    
    enum Image {
        static let fontSize = 40.0
        static let sideLength = 70.0
    }
    
    static let cornerRadius = 25.0
}

#Preview {
    NoteCard()
}
