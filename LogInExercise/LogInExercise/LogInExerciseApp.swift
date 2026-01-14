//
//  LogInExerciseApp.swift
//  LogInExercise
//
//  Created by Robin Roelandt on 14/01/2026.
//

import SwiftUI

@main
struct LogInExerciseApp: App {
    @State var uurroosterDataStore = UurroosterDataStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(uurroosterDataStore)
        }
    }
}
