//
//  TestView2.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/26.
//

import SwiftUI


struct ReservationView: View {
    @State var selectedDate = Date()
    @State var selectedTimeSlot: Date?
    var calendar = Calendar.current
    let timeSlotDuration: TimeInterval = 30 * 60 // 30 minutes in seconds
//    @Environment(\.presentationMode) var
//    presentationMode
    @Binding var isPresentingModal: Bool
    
    var body: some View {
        VStack {
            DatePicker("Select a Date", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()

//            if let selectedTimeSlot = selectedTimeSlot {
//                Text("Selected Time Slot:")
//                Text(timeString(from: selectedTimeSlot))
//                    .font(.headline)
//            }
            Divider()
            VStack(alignment: .leading){
                Rectangle().frame(height: 0)
                Text("시간 선택")
                  .font(
                    Font.custom("Public Sans", size: 17)
                      .weight(.bold)
                  )
                  .foregroundColor(.black)
                  .padding(.leading, 17)
                  .padding(.bottom, 13)
                
                Text("* 병원 확인 후 예약 확정")
                  .font(
                    Font.custom("Public Sans", size: 11)
                      .weight(.bold)
                  )
                  .foregroundColor(Color(red: 0.29, green: 0.29, blue: 0.29))
                  .padding(.leading, 27)
            }

            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 11), count: 4), spacing: 16) {
                    ForEach(timeSlots(for: selectedDate), id: \.self) { timeSlot in
                        Button(action: {
                            selectedTimeSlot = timeSlot
                        }) {
                            Text(timeString(from: timeSlot))
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .background(timeSlotBackground(for: timeSlot))
//                                .cornerRadius(10)
                                .foregroundColor(timeSlotForeground(for: timeSlot))
                        }
                        .disabled(isTimeSlotBooked(timeSlot))
                    }
                }
                .padding()
            }
            NavigationLink(destination: FinishView( isPresentingModal: $isPresentingModal), label: {
                ZStack {
                    Rectangle().frame(width: 345, height: 57)
                        .cornerRadius(8)
                        .foregroundColor(.BackgroundBlue)
                    
                    Text("다음")
                        .font(
                            Font.custom("Pretendard", size: 16)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 10)
            })
            
        }.navigationBarBackButtonHidden(true)
        .navigationBarTitle("상담받기", displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: {
                                    isPresentingModal.toggle()
                                }) {
                                    Image("Expand_left")
                                }
                            )
    }

    private func timeSlots(for date: Date) -> [Date] {
        var components = calendar.dateComponents([.year, .month, .day], from: date)
        components.hour = 10 // Set the hour to 10 AM
        components.minute = 0
        components.second = 0
        
        guard let startDate = calendar.date(from: components) else {
            return []
        }

        let numberOfTimeSlots = Int(24 * 60 * 60 / timeSlotDuration)
        
        return (0..<numberOfTimeSlots).compactMap { index in
            calendar.date(byAdding: .second, value: Int(timeSlotDuration) * index, to: startDate)
        }
    }

    private func timeString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

    private func timeSlotBackground(for timeSlot: Date) -> Color {
        return selectedTimeSlot == timeSlot ? .BackgroundBlue : Color(red: 0.85, green: 0.85, blue: 0.85)
    }

    private func timeSlotForeground(for timeSlot: Date) -> Color {
        return selectedTimeSlot == timeSlot ? .white : .black
    }

    private func isTimeSlotBooked(_ timeSlot: Date) -> Bool {
        // Implement your logic to check if a time slot is booked
        return false
    }
}


struct RectangleView: View {
    var body: some View {
        Text("This is a multiline text view. It has multiple lines of text.")
            .font(.headline)
            .multilineTextAlignment(.trailing) // Align text to the right
            .padding()
    }
}




struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
//        ReservationView()
        ContentView()
        RectangleView()
    }
}

