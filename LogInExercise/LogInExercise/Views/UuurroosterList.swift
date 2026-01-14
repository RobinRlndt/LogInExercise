//
//  UuurroosterList.swift
//  LogInExercise
//
//  Created by Robin Roelandt on 14/01/2026.
//

import SwiftUI

struct UuurroosterList: View {
    @State var loading = true
    @State var selectedEvent: EventModel?
    @Binding var isLoggedIn: Bool
    
    @Environment(UurroosterDataStore.self) var uurroosterDataStore
    
    var body: some View {
        Group {
            if isLoggedIn {
                NavigationSplitView {
                        if loading {
                            ProgressView("Loading...")
                        } else {
                            List(uurroosterDataStore.uurrooster, id: \.self, selection: $selectedEvent) { event in
                                VStack(alignment: .leading) {
                                    Text(DateUtil.formatDateTime(date: event.startDateTime))
                                        .font(.title2)
                                    Text(event.title)
                                        .font(.title)
                                }
                            }
                        }
                } detail: {
                    if let selectedEvent {
                        UurroosterDetailView(selectedEvent: $selectedEvent)
                    } else {
                        Text("Select an event")
                    }
                }
                .task {
                    await uurroosterDataStore.loadData()
                    loading = false
                }
                .navigationTitle("Uurrooster")
            } else {
                NavigationStack {
                    VStack {
                        Text("Please log in.")
                        NavigationLink {
                            LoginView(isLoggedIn: $isLoggedIn)
                        } label: {
                            Text("Log in")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .navigationTitle("Uurrooster")
                }
            }
        }
    }
}
