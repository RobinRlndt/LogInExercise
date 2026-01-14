//
//  LogInView.swift
//  LogInExercise
//
//  Created by Robin Roelandt on 14/01/2026.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var username = ""
    @State private var password = ""
    @State private var showErrorAlert = false
    @State private var errorMessage = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Logo/Header
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)

                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // Login Form
                VStack(spacing: 16) {
                    TextField("Username", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()

                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)

                    Button("Login") {
                        attemptLogin()
                    }
                    .buttonStyle(.borderedProminent)
                    .frame(maxWidth: .infinity)
                    .disabled(username.isEmpty || password.isEmpty)
                }
                .padding(.horizontal, 40)

                VStack(spacing: 8) {
                    Text("Demo Credentials:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("Username: admin")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text("Password: password123")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 20)

                Spacer()
            }
            .padding()
            .navigationTitle("Login")
            .alert("Login Failed", isPresented: $showErrorAlert) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
        }
    }

    private func attemptLogin() {
        if username.lowercased() == "admin" && password == "password123" {
            withAnimation {
                isLoggedIn = true
            }
        } else {
            errorMessage = "Invalid username or password. Please try again."
            showErrorAlert = true
        }
    }
}


