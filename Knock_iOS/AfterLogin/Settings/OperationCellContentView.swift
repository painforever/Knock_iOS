//
//  OperationCellContentView.swift
//  Knock_iOS
//
//  Created by yusong on 1/18/22.
//

import SwiftUI

struct OperationCellContentView: View {
    @Binding var icon: String
    @Binding var title: String
    @Binding var sideLength: CGFloat
    var body: some View {
        VStack {
            Image(icon)
                .resizable()
                .foregroundColor(Color(Constants.themeColor))
                .frame(width: 50, height: 50)
            Text(title)
        }
        .frame(width: sideLength, height: sideLength)
        .padding()
            
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(Constants.themeColor), lineWidth: 2))
    }
}

struct OperationCellContentView_Previews: PreviewProvider {
    static var previews: some View {
        OperationCellContentView(icon: .constant("knock"), title: .constant("Send Knock"), sideLength: .constant(200))
    }
}
