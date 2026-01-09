//
//  ListScreen.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 08.01.2026.
//

import SwiftUI

struct ListScreen: View {
    @StateObject private var viewModel = NoteViewModel()
    @State private var isShowingAddNoteSheet = false
    @State private var selectedNote: NoteModel? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.notes.isEmpty {
                    Divider()
                    VStack(spacing: 20) {
                        Spacer()
                        Image(systemName: "text.badge.xmark")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(Metrics.color)
                            .font(.system(size: 80))
                        
                        VStack(spacing: 8) {
                            Text("Your list is empty.")
                                .font(.title2.bold())
                                .foregroundColor(Metrics.color)
                            
                            Text("Add your first weather note by clicking the + button at the top.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40)
                        } // VStack
                        Spacer()
                    } // VStack
                    .frame(maxWidth: .infinity)
                } else {
                    Divider()
                    ScrollView {
                        ForEach(viewModel.notes) { note in
                            Button {
                                selectedNote = note
                            } label: {
                                NoteCard(note: note)
                            }
                            .buttonStyle(.plain)
                            Divider()
                                .frame(width: Metrics.Note.deviderWidth)
                        }
                    } // ScrollView
                    .sheet(item: $selectedNote) { noteToDisplay in
                        NoteDetailsView(note: noteToDisplay)
                    }
                }
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
                        .foregroundStyle(Metrics.color)
                } // ToolbarItem
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingAddNoteSheet = true
                    } label: {
                        Image(systemName: Metrics.AddButton.systemImage)
                            .font(.system(
                                size: Metrics.AddButton.fontSize,
                                weight: Metrics.AddButton.fontWeight
                            ))
                            .foregroundStyle(Metrics.color)
                            .padding(Metrics.AddButton.padding)
                    }
                    .sheet(isPresented: $isShowingAddNoteSheet, onDismiss: {
                        viewModel.fetchNotes()
                    }) {
                        AddNoteView()
                    }
                } // ToolbarItem
            } // toolbar
        } // NavigationStack
    }
}

private enum Metrics {
    enum Title {
        static let text = "WeatherNotes"
        static let padding = 5.0
        static let fontSize = 35.0
        static let fontWeight: Font.Weight = .bold    }
    
    enum AddButton {
        static let systemImage = "plus"
        static let fontWeight: Font.Weight = .bold
        static let fontSize = 30.0
        static let padding = 20.0
    }
    
    enum Note {
        static let deviderWidth = 300.0
    }
    
    static let color: Color = .indigo
}

#Preview {
    ListScreen()
}
