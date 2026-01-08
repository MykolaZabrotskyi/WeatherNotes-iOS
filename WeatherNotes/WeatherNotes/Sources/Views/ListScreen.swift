//
//  ListScreen.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 08.01.2026.
//

import SwiftUI

struct ListScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    NoteCard()
                    NoteCard()
                    NoteCard()
                    NoteCard()
                } // ScrollView
            } // VStack
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(Metrics.Title.text)
                        .padding(.leading, Metrics.Title.padding)
                        .font(Font.system(
                            size: Metrics.Title.fontSize,
                            weight: Metrics.Title.fontWeight)
                        )
                        .foregroundStyle(Metrics.Title.color)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {

                    } label: {
                        Image(systemName: Metrics.AddButton.systemImage)
                            .font(.system(
                                size: Metrics.AddButton.fontSize,
                                weight: Metrics.AddButton.fontWeight
                            ))
                            .foregroundStyle(Metrics.AddButton.color)
                            .padding(Metrics.AddButton.padding)
                    }
                }
            }
        } // NavigationStack
    }
}

private enum Metrics {
    enum Title {
        static let text = "WeatherNotes"
        static let padding = 5.0
        static let fontSize = 35.0
        static let fontWeight: Font.Weight = .bold
        static let color: Color = .indigo
    }
    
    enum AddButton {
        static let systemImage = "plus"
        static let fontWeight: Font.Weight = .bold
        static let fontSize = 30.0
        static let color: Color = .indigo
        static let padding = 20.0
    }
    
    static let color: Color = .indigo
}

#Preview {
    ListScreen()
}
