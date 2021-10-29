//
//  DiscoverContentView.swift
//  Knock_iOS
//
//  Created by yusong on 10/28/21.
//

import SwiftUI

struct DiscoverContentView: View {
    @State var searchTerm: String = "Elon Musk"
    var body: some View {
        ZStack {
            Rectangle().fill(Color(Constants.themeColor))
            VStack {
                HStack {
                    Text("Discover").font(.system(size: 50, weight: .heavy))
                    Spacer()
                }.padding(.horizontal, 20)
                
                TextField("People or fields you are interested...", text: $searchTerm).padding().overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 1)).foregroundColor(.white).padding()
                
            }
            
        }.ignoresSafeArea()
    }
}

struct DiscoverContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverContentView()
    }
}
