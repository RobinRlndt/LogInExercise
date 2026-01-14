//
//  ProfileView.swift
//  LogInExercise
//
//  Created by Robin Roelandt on 14/01/2026.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.blue)

            Text("User Profile")
                .font(.title)
                .padding()

            Form {
                Section("Personal Information") {
                    LabeledContent("Username", value: "admin")
                    LabeledContent("Email", value: "admin@example.com")
                    LabeledContent("Member since", value: "2024")
                }
            }
        }
        .navigationTitle("Profile")
    }
}
