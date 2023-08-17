//
//  TestView.swift
//  Bareuni
//
//  Created by 황인성 on 2023/07/11.
//

import SwiftUI

struct HCalendarView: View {
    @State var currentDate = Date()
    @State var selectedDate = Date()
    @State var tabIndex = 0
    
    private let calendar = Calendar.current
//    var nextMonth = Calendar.current.date(byAdding: .month, value: 1, to: selectedDate)!
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            HStack {
                Spacer().frame(width: 32)
                TabBarButton(text: monthTitle(from: currentDate), isSelected: .constant(tabIndex == 0))
                    .onTapGesture { onButtonTapped(index: 0) }
                
                Spacer().frame(width: 13)
                
                TabBarButton(text: nextMonthTitle(from: currentDate), isSelected: .constant(tabIndex == 1))
                    .onTapGesture { onButtonTapped(index: 1) }
                
                Spacer()
            }
            
            if tabIndex == 0 {
                DayView(selectedDate: $selectedDate)
            }
            else if tabIndex == 1 {
                NextDayView(selectedDate: $selectedDate)
            }
            
            ZStack {
                VStack{
//                    dayView
                    
                    timeCellView(currentDay: selectedDate)
                }
//                blurView
            }
            .frame(height: 30)
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - 월 표시 뷰
    private var monthView: some View {
        
        
        
        HStack(spacing: 30) {
            Button(
                action: {
                    changeMonth(-1)
                },
                label: {
                    Image(systemName: "chevron.left")
                        .padding()
                }
            )
            
            Text(monthTitle(from: selectedDate))
                .font(.title)
            Text(nextMonthTitle(from: selectedDate))
                .font(.title)
            
//            MonthTopTabBar
            
            Button(
                action: {
                    changeMonth(1)
                },
                label: {
                    Image(systemName: "chevron.right")
                        .padding()
                }
            )
        }
    }
    
    // MARK: - 일자 표시 뷰
    @ViewBuilder
    private var dayView: some View {
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: selectedDate))!
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                let components = (
                    Calendar.current.component(.day, from: Date())-1..<calendar.range(of: .day, in: .month, for: startDate)!.count)
                    .map {
                        calendar.date(byAdding: .day, value: $0, to: startDate)!
                    }
                
                ForEach(components, id: \.self) { date in
                    VStack {
                        Text(day(from: date))
                            .font(.caption)
                        Text("\(calendar.component(.day, from: date))")
                    }
                    .frame(width: 30, height: 30)
                    .padding(5)
                    .background(calendar.isDate(selectedDate, equalTo: date, toGranularity: .day) ? Color.green : Color.clear)
                    .cornerRadius(16)
                    .foregroundColor(calendar.isDate(selectedDate, equalTo: date, toGranularity: .day) ? .white : .black)
                    .onTapGesture {
                        selectedDate = date
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var nextDayView: some View {
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: selectedDate))!
        let nextMonthDate = calendar.date(byAdding: .month, value: 1, to: selectedDate)!
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                let components = (
                    calendar.component(.day, from: Date())-1..<calendar.range(of: .day, in: .month, for: nextMonthDate)!.count)
                    .map {
                        calendar.date(byAdding: .day, value: $0, to: nextMonthDate)!
                    }
                
                ForEach(components, id: \.self) { date in
                    VStack {
                        Text(day(from: date))
                            .font(.caption)
                        Text("\(calendar.component(.day, from: date))")
                    }
                    .frame(width: 30, height: 30)
                    .padding(5)
                    .background(calendar.isDate(selectedDate, equalTo: date, toGranularity: .day) ? Color.green : Color.clear)
                    .cornerRadius(16)
                    .foregroundColor(calendar.isDate(selectedDate, equalTo: date, toGranularity: .day) ? .white : .black)
                    .onTapGesture {
                        selectedDate = date
                    }
                }
            }
        }
    }


    
    
    
    // MARK: - 블러 뷰
    private var blurView: some View {
        HStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.white.opacity(1),
                        Color.white.opacity(0)
                    ]
                ),
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(width: 20)
            .edgesIgnoringSafeArea(.leading)
            
            Spacer()
            
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.white.opacity(1),
                        Color.white.opacity(0)
                    ]
                ),
                startPoint: .trailing,
                endPoint: .leading
            )
            .frame(width: 20)
            .edgesIgnoringSafeArea(.leading)
        }
    }
}

// MARK: - 로직
private extension HCalendarView {
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
    /// 월 표시
    func monthTitle(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("M")
        return dateFormatter.string(from: date)
    }
    
    private func nextMonthTitle(from date: Date) -> String {
        guard let nextMonth = calendar.date(byAdding: .month, value: 1, to: date) else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("M")
        return dateFormatter.string(from: nextMonth)
    }
    
    /// 월 변경
    func changeMonth(_ value: Int) {
        guard let date = calendar.date(
            byAdding: .month,
            value: value,
            to: selectedDate
        ) else {
            return
        }
        
        selectedDate = date
    }
    
    /// 요일 추출
    func day(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("E")
        return dateFormatter.string(from: date)
    }
    
    // Function to change time in 30-minute intervals
    func changeTime(_ value: Int) {
        guard let minutesToAdd = calendar.date(
            byAdding: .minute,
            value: value * 30,  // 30 minutes interval
            to: selectedDate
        ) else {
            return
        }
        
        selectedDate = minutesToAdd
    }
}

struct timeCellView : View {
    let currentDay : Date
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.white)
            Text("\(currentDay)에 해당하는 내용")
        }
    }
}

struct MonthTopTabBar: View {
    @Binding var tabIndex: Int
    @Binding var selectedDate: Date
    private let calendar = Calendar.current
    @Namespace var animation
    var body: some View {
        HStack {
            Spacer().frame(width: 32)
            TabBarButton(text: monthTitle(from: selectedDate), isSelected: .constant(tabIndex == 0))
                .onTapGesture { onButtonTapped(index: 0) }
            
            Spacer().frame(width: 13)
            
            TabBarButton(text: nextMonthTitle(from: selectedDate), isSelected: .constant(tabIndex == 1))
                .onTapGesture { onButtonTapped(index: 1) }
            
            Spacer()
        }
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
    func monthTitle(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("M")
        return dateFormatter.string(from: date)
    }
    private func nextMonthTitle(from date: Date) -> String {
        guard let nextMonth = calendar.date(byAdding: .month, value: 1, to: date) else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("M")
        return dateFormatter.string(from: nextMonth)
    }
}

struct MonthTabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        VStack {
            Text(text)
                .font(
                    Font.custom("Pretendard", size: 18)
                        .weight(.semibold)
                )
                .thickUnderline(color: isSelected ? .blue : .white, thickness: 4, radius: 10)
                .baselineOffset(30)
        }
    }
}

struct DayView: View {
    
    @Binding var selectedDate: Date
    private let calendar = Calendar.current
    let startDate = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Date()))!
    
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                let components = (
                    Calendar.current.component(.day, from: Date())-1..<calendar.range(of: .day, in: .month, for: startDate)!.count)
                    .map {
                        calendar.date(byAdding: .day, value: $0, to: startDate)!
                    }
                
                ForEach(components, id: \.self) { date in
                    VStack {
                        Text(day(from: date))
                            .font(.caption)
                        Text("\(calendar.component(.day, from: date))")
                    }
                    .frame(width: 30, height: 30)
                    .padding(5)
                    .background(calendar.isDate(selectedDate, equalTo: date, toGranularity: .day) ? Color.green : Color.clear)
                    .cornerRadius(16)
                    .foregroundColor(calendar.isDate(selectedDate, equalTo: date, toGranularity: .day) ? .white : .black)
                    .onTapGesture {
                        selectedDate = date
                    }
                }
            }
        }
    }
    
    func day(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("E")
        return dateFormatter.string(from: date)
    }
}

//struct NextDayView: View {
//
//    @Binding var selectedDate: Date
//    private let calendar = Calendar.current
//    let startDate = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Date()))!
//    let nextMonthDate = Calendar.current.date(byAdding: .month, value: 1, to: Date())!
//
//    var body: some View{
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 10) {
//                let components = (
//                                0..<calendar.range(of: .day, in: .month, for: nextMonthDate)!.count)
//                                .map {
//                                    calendar.date(byAdding: .day, value: $0, to: nextMonthDate)!
//                                }
//
//                ForEach(components, id: \.self) { date in
//                    VStack {
//                        Text(day(from: date))
//                            .font(.caption)
//                        Text("\(calendar.component(.day, from: date))")
//                    }
//                    .frame(width: 30, height: 30)
//                    .padding(5)
//                    .background(calendar.isDate(selectedDate, equalTo: date, toGranularity: .day) ? Color.green : Color.clear)
//                    .cornerRadius(16)
//                    .foregroundColor(calendar.isDate(selectedDate, equalTo: date, toGranularity: .day) ? .white : .black)
//                    .onTapGesture {
//                        selectedDate = date
//                    }
//                }
//            }
//        }
//    }
//
//    func day(from date: Date) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.setLocalizedDateFormatFromTemplate("E")
//        return dateFormatter.string(from: date)
//    }
//}

struct NextDayView: View {

    @Binding var selectedDate: Date
    private let calendar = Calendar.current

    var body: some View {
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedDate))!
        let nextMonthDate = calendar.date(byAdding: .month, value: 1, to: startDate)!

        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                let components = (
                    0..<calendar.range(of: .day, in: .month, for: nextMonthDate)!.count)
                    .map {
                        calendar.date(byAdding: .day, value: $0, to: nextMonthDate)!
                    }

                ForEach(components, id: \.self) { date in
                    VStack {
                        Text(day(from: date))
                            .font(.caption)
                        Text("\(calendar.component(.day, from: date))")
                    }
                    .frame(width: 30, height: 30)
                    .padding(5)
                    .background(calendar.isDate(selectedDate, equalTo: date, toGranularity: .day) ? Color.green : Color.clear)
                    .cornerRadius(16)
                    .foregroundColor(calendar.isDate(selectedDate, equalTo: date, toGranularity: .day) ? .white : .black)
                    .onTapGesture {
                        print(calendar.component(.month, from: date))
                        print(calendar.component(.month, from: selectedDate))
                        if calendar.component(.month, from: date) == calendar.component(.month, from: selectedDate) {
                            selectedDate = date
                        }
                    }
                }
            }
        }
    }

    func day(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("E")
        return dateFormatter.string(from: date)
    }
}



struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        HCalendarView()
    }
}
