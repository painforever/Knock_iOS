//
//  CalendarContentView.swift
//  Knock_iOS
//
//  Created by yusong on 11/7/21.
//

import SwiftUI

struct CalendarContentView: View {
    @State var currentDate: Date = Date()
    
    var body: some View {
        ZStack {
            //Rectangle().fill(Color(Constants.themeColor)).ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    CustomDatePickerContentView(currentDate: $currentDate)
                }
                .padding(.vertical)
            }.safeAreaInset(edge: .bottom) {
                
            }
        }
    }
}

struct CalendarContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarContentView()
    }
}
