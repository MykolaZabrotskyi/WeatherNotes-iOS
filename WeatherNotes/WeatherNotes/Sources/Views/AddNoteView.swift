//
//  AddNoteView.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 08.01.2026.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.dismiss) var dismiss
    @State var noteTitle: String = ""
    @State private var noteDescription: String = "Description"
    
    var body: some View {
        NavigationStack {
            List {
                HStack{
                    Text("Title")
                    Spacer()
                    TextField("Text", text: $noteTitle)
                        .multilineTextAlignment(.trailing)
                } // HStack
                HStack{
                    TextEditor(text: $noteDescription)
                        .scrollDisabled(true)
                        .foregroundStyle(noteDescription == "Description"
                                         ? Metrics.Description.emptyDescriptionColor
                                         : Metrics.Description.descriptionColor)
                        .frame(height: Metrics.Description.frameHeight)
                } // HStack
            } // List
            .scrollDisabled(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(Metrics.Buttons.color)
                    .font(Font.system(
                        size: Metrics.Buttons.fontSize,
                        weight: Metrics.Buttons.fontWeight)
                    )
                }
                ToolbarItem(placement: .principal) {
                    Text("Add Note")
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
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        
                        dismiss()
                    }
                    .disabled(noteTitle.isEmpty || noteDescription == "Description")
                    .foregroundStyle(Metrics.Buttons.color)
                    .font(Font.system(
                        size: Metrics.Buttons.fontSize,
                        weight: Metrics.Buttons.fontWeight)
                    )
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
    
    enum Description {
        static let frameHeight = 200.0
        static let emptyDescriptionColor: Color = .gray
        static let descriptionColor: Color = .black
    }
    
    static let cornerRadius = 25.0
}

#Preview {
    AddNoteView()
}
