//
//  DNAsContentView.swift
//  Knock_iOS
//
//  Created by yusong on 1/18/22.
//

import SwiftUI

struct DNAsContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("His DNAs").bold().font(.title2)
            }
            HStack {
                Text("Business Development").themeDNA()
                Text("Sports").themeDNA()
                Text("Entrepreneurship").themeDNA()
            }
            HStack {
                Text("Writing").themeDNA()
                Text("Music").themeDNA()
                Text("Travel").themeDNA()
            }
            HStack {
                Text("Start Up").themeDNA()
                Text("Poetry").themeDNA()
                Text("Food").themeDNA()
            }
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(Constants.themeColor), lineWidth: 2))
    }
}

struct DNAsContentView_Previews: PreviewProvider {
    static var previews: some View {
        DNAsContentView()
    }
}
