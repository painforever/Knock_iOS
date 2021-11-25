//
//  CustomDatePickerContentView.swift
//  Knock_iOS
//
//  Created by yusong on 11/8/21.
//

import SwiftUI
import Alamofire

struct CustomDatePickerContentView: View {
    @Binding var currentDate: Date
    
    //Month update on arrow button clicks
    @State var currentMonth: Int = 0
    //data...
    @State var knockDataByDay: [KnockCalendarResponse] = []
    
    var body: some View {
        VStack(spacing: 35) {
            
            let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(extractDate()[0]).font(.caption).fontWeight(.semibold)
                    
                    Text(extractDate()[1]).font(.title.bold())
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    withAnimation {
                        currentMonth -= 1
                    }
                }, label: {
                    Image(systemName: "chevron.left").font(.title2)
                })
                
                Button(action: {
                    withAnimation {
                        currentMonth += 1
                    }
                }, label: {
                    Image(systemName: "chevron.right").font(.title2)
                })
            }.padding(.horizontal)
            //Day View
            
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    Text(day).font(.callout).fontWeight(.semibold).frame(maxWidth: .infinity)
                }
            }
            
            //Dates
            // Lazy Grid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(extractDate()) { value in
                    CardView(value: value).background(
                        Capsule().fill(Color(Constants.themeColor))
                            .padding(.horizontal, 8)
                            .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                    )
                    .onTapGesture {
                        currentDate = value.date
                    }
                }
            }
            
            VStack(spacing: 15) {
                Text("Tasks")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 20)
                
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                }) {
                    ForEach(task.task) { task in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(task.time.addingTimeInterval(TimeInterval(CGFloat.random(in: 0...5000))), style: .time).foregroundColor(.white).fontWeight(.bold)
                            
                            Text(task.title).font(.title2.bold())
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            Color(Constants.themeColor).opacity(0.5).cornerRadius(10)
                        )
                    }
                }
                else {
                    Text("No Task Found")
                }
            }.padding()
        }
        .onChange(of: currentMonth) { newValue in
            //Update month
            currentDate = getCurrentMonth()
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }) {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                    Circle().fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : Color(Constants.themeColor))
                        .frame(width: 8, height: 8)
                }
                else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
    }
    
    //checking dates
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    //Extracting Year and Month for displaying
    func extractDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        return date.components(separatedBy: " ")
    }
    
    func extractDate() -> [DateValue] {
        //Getting current month date
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        
        //adding offset days to get exact week day
        let firstWeekDay = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekDay - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else { return Date() }
        return currentMonth
    }
    
    func loadDayKnocks() {
        if let userId = UserDefaults.standard.string(forKey: Constants.userId) {
            AF.request("\(Constants.BaseUrl)/knocks/daily_knocks.json", method: .get, parameters: ["user_id": userId]).responseJSON { data in
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let json = try! jsonDecoder.decode([KnockCalendarResponse].self, from: data.data!)
                knockDataByDay = json
            }
        }
    }
}

extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        //Get the start date
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}

struct CustomDatePickerContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePickerContentView(currentDate: .constant(Date()))
    }
}
