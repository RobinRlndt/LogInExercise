//
//  WelcomeView.swift
//  LogInExercise
//
//  Created by Robin Roelandt on 14/01/2026.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var isLoggedIn: Bool
    @State private var showLogoutConfirmation = false

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.green)

                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("You have successfully logged in")
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                VStack(spacing: 16) {
                    NavigationLink("View Profile") {
                        ProfileView()
                    }
                    .buttonStyle(.bordered)
                    .frame(maxWidth: .infinity)

                    NavigationLink("Settings") {
                        SettingsView()
                    }
                    .buttonStyle(.bordered)
                    .frame(maxWidth: .infinity)

                    Button("Logout") {
                        showLogoutConfirmation = true
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 40)
                .padding(.top, 30)

                Spacer()
            }
            .padding()
            .navigationTitle("Home")
            .confirmationDialog("Logout", isPresented: $showLogoutConfirmation) {
                Button("Logout", role: .destructive) {
                    performLogout()
                }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Are you sure you want to logout?")
            }
        }
    }

    private func performLogout() {
        withAnimation {
            isLoggedIn = false
        }
    }
}
