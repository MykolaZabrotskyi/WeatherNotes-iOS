//
//  NotesStorage.swift
//  WeatherNotes
//
//  Created by Mykola Zabrotskyi on 09.01.2026.
//

import Foundation

class NotesStorage {
    private let key = "saved_notes"

    func load() -> [NoteModel] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        return (try? JSONDecoder().decode([NoteModel].self, from: data)) ?? []
    }

    func save(_ notes: [NoteModel]) {
        let data = try? JSONEncoder().encode(notes)
        UserDefaults.standard.set(data, forKey: key)
    }

    func add(_ note: NoteModel) {
        var notes = load()
        notes.append(note)
        save(notes)
    }
}
