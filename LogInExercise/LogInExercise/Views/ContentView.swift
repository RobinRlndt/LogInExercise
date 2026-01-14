//
//  ContentView.swift
//  LogInExercise
//
//  Created by Robin Roelandt on 14/01/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        TabView {
            Tab {
                HomeView(isLoggedIn: $isLoggedIn)
            } label: {
                Image(systemName: "person.fill")
            }
            Tab {
                UuurroosterList(isLoggedIn: $isLoggedIn)
            } label: {
                Image(systemName: "house")
            }
            Tab {
                SettingsView()
            } label: {
                Image(systemName: "gear")
            }
        }
        .padding()
    }
}


