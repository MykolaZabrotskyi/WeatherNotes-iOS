//
//  NoteViewModel.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 09.01.2026.
//

import Foundation
import Combine

@MainActor
class NoteViewModel: ObservableObject {
    @Published var notes: [NoteModel] = []
    
    private let storage = NotesStorage()
    
    init() {
        fetchNotes()
    }
    
    func fetchNotes() {
        let loadedNotes = storage.load()
        self.notes = loadedNotes.sorted { $0.date > $1.date }
    }
}
