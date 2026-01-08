//
//  AddNoteView.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 08.01.2026.
//

import SwiftUI

struct AddNoteView: View {
    
    var body: some View {
        NavigationStack {
            VStack() {
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        
                    }
                        .foregroundStyle(Metrics.Buttons.color)
                        .font(Font.system(
                            size: Metrics.Buttons.fontSize,
                            weight: Metrics.Buttons.fontWeight
                        ))
                }
                ToolbarItem(placement: .principal) {
                    Text("Add Note")
                        .font(Font.system(
                            size: Metrics.Title.fontSize,
                            weight: Metrics.Title.fontWeight
                        ))
                        .foregroundStyle(Metrics.Title.color)
                        .padding(.horizontal, Metrics.Title.Frame.horizontalPadding)
                        .padding(.vertical, Metrics.Title.Frame.verticalPadding)
                        .background(
                            RoundedRectangle(cornerRadius: Metrics.cornerRadius)
                                .fill(Metrics.Title.Frame.color)
                        )
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        
                    }
                    .foregroundStyle(Metrics.Buttons.color)
                    .font(Font.system(
                        size: Metrics.Buttons.fontSize,
                        weight: Metrics.Buttons.fontWeight
                    ))
                }
            }
        }
    }
}

private enum Metrics {
    enum Title {
        static let fontSize = 30.0
        static let fontWeight: Font.Weight = .semibold
        static let color: Color = .white
        enum Frame {
            static let horizontalPadding = 16.0
            static let verticalPadding = 8.0
            static let color: Color = .indigo
        }
    }
    
    enum Buttons {
        static let fontSize = 25.0
        static let fontWeight: Font.Weight = .regular
        static let color: Color = .indigo
    }
    
    static let cornerRadius = 25.0
}

#Preview {
    AddNoteView()
}
