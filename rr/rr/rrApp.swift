//
//  rrApp.swift
//  rr
//
//  Created by student on 04/12/25.
//

import SwiftUI
import SwiftData
@main
struct rrApp: App {
    var body: some Scene {
        WindowGroup {
            NotesApp()
                .modelContainer(for:Listt.self)
        }
    }
}
