//
//  ListScreen.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 08.01.2026.
//

import SwiftUI

struct ListScreen: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(Metrics.Title.text)
                    .fontWeight(.bold)
                    .font(Font.system(size: Metrics.Title.fontSize))
                    .foregroundStyle(Metrics.color)
                Spacer()
                Button(action: {
                } ) {
                    Label("", systemImage: Metrics.AddButton.systemImage)
                        .font(Font.system(size: Metrics.AddButton.fontSize))
                        .foregroundStyle(Metrics.color)
                } // Button
                Spacer()
            } // HStack
            ScrollView {
                NoteCard()
                NoteCard()
                NoteCard()
                NoteCard()
            } // ScrollView
        } // VStack
    }
}

private enum Metrics {
    enum Title {
        static let text = "WeatherNotes"
        static let fontSize = 35.0
        static let fontWeight: Font.Weight = .bold
        static let color: Color = .indigo
    }
    
    enum AddButton {
        static let systemImage = "plus.capsule.fill"
        static let fontSize = 60.0
    }

    static let color: Color = .indigo
}

#Preview {
    ListScreen()
}
