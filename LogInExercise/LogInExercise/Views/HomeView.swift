//
//  HomeView.swift
//  LogInExercise
//
//  Created by Robin Roelandt on 14/01/2026.
//

import SwiftUI

struct HomeView: View {
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        Group {
        if isLoggedIn {
                        WelcomeView(isLoggedIn: $isLoggedIn)
            } else {
                        LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

