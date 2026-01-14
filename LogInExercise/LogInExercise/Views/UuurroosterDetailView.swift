//
//  UuurroosterDetailView.swift
//  LogInExercise
//
//  Created by Robin Roelandt on 14/01/2026.
//

import SwiftUI

struct UurroosterDetailView: View {
    @Binding var selectedEvent: EventModel?

    var body: some View {
            if let selectedEvent = selectedEvent {
                VStack {
                    Text(selectedEvent.title)
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .background(.tint)
                        .cornerRadius(15)
                        .foregroundStyle(.white)
                        .padding(.bottom)
                    
                    Divider()
                    
                    Text(selectedEvent.location)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom)
                    
                    Grid(alignment: .leading) {
                        GridRow {
                            Text("Start")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(DateUtil.formatDateTime(date: selectedEvent.startDateTime))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        GridRow {
                            Text("Einde")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(DateUtil.formatDateTime(date: selectedEvent.endDateTime))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                
                .navigationTitle("Uurrooster detail")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
            } else {
                Text("No event selected")
            }
        }
    }


