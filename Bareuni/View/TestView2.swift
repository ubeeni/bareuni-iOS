//
//  TestView2.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/26.
//

import SwiftUI


struct ReservationView: View {
    @State private var selectedDate = Date()
    @State private var selectedTimeSlot: Date?
    // You would replace this with your own data model for reservations
    
    private var calendar = Calendar.current

    private let timeSlotDuration: TimeInterval = 30 * 60 // 30 minutes in seconds
    
    var body: some View {
        VStack {
            DatePicker("Select a Date", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()

            if let selectedTimeSlot = selectedTimeSlot {
                    Text("Selected Time Slot:")
                    Text(timeString(from: selectedTimeSlot))
                        .font(.headline)
                }
            
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), spacing: 16) {
                    ForEach(timeSlots(for: selectedDate), id: \.self) { timeSlot in
                        Button(action: {
                            selectedTimeSlot = timeSlot
                        }) {
                            Text(timeString(from: timeSlot))
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .background(timeSlotBackground(for: timeSlot))
                                .cornerRadius(10)
                                .foregroundColor(timeSlotForeground(for: timeSlot))
                        }
                        .disabled(isTimeSlotBooked(timeSlot))
                    }
                }
                .padding()
            }
        }
    }

    private func timeSlots(for date: Date) -> [Date] {
        let startOfDay = calendar.startOfDay(for: date)
        let numberOfTimeSlots = Int(24 * 60 * 60 / timeSlotDuration)
        
        return (0..<numberOfTimeSlots).compactMap { index in
            calendar.date(byAdding: .second, value: Int(timeSlotDuration) * index, to: startOfDay)
        }
    }

    private func timeString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

    private func timeSlotBackground(for timeSlot: Date) -> Color {
        return selectedTimeSlot == timeSlot ? .blue : .gray
    }

    private func timeSlotForeground(for timeSlot: Date) -> Color {
        return selectedTimeSlot == timeSlot ? .white : .black
    }

    private func isTimeSlotBooked(_ timeSlot: Date) -> Bool {
        // Implement your logic to check if a time slot is booked
        return false
    }
}

struct CustomDatePickerStyle: DatePickerStyle {
    @State private var currentDate = Date()
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
                .font(.title)
                .padding()
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 20))
                
            HStack {
                
                Button {
                    currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
                } label: {
                    Image(systemName: "minus.circle")
                        .font(.title)
                        .padding()
                        .background(.thinMaterial)
                        .clipShape(Circle())
                }
Text(currentDate.formatted(date: .abbreviated, time: .shortened))
                
                Button {
                    currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.title)
                        .padding()
                        .background(.thinMaterial)
                        .clipShape(Circle())
                }
            }
        }
    }
}






struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
    }
}

