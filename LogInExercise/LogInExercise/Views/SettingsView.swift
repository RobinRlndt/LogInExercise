//
//  SettingsView.swift
//  LogInExercise
//
//  Created by Robin Roelandt on 14/01/2026.
//

import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false

    var body: some View {
        Form {
            Section("Preferences") {
                Toggle("Notifications", isOn: $notificationsEnabled)
                Toggle("Dark Mode", isOn: $darkModeEnabled)
            }

            Section("About") {
                LabeledContent("Version", value: "1.0.0")
                LabeledContent("Build", value: "100")
            }
        }
        .navigationTitle("Settings")
    }
}
