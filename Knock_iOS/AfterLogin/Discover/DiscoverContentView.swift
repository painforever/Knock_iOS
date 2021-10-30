//
//  DiscoverContentView.swift
//  Knock_iOS
//
//  Created by yusong on 10/28/21.
//

import SwiftUI

struct DiscoverContentView: View {
    @State var searchTerm: String = ""
    @State var showFilterPeopleContentView = false
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color(Constants.themeColor)).ignoresSafeArea()
            VStack {
                HStack {
                    Text("Discover").font(.system(size: 50, weight: .heavy)).foregroundColor(.white)
                    Spacer()
                }.padding(.horizontal, 20)
                
                HStack(alignment: .center, spacing: 10) {
                    TextField("People or fields you are interested...", text: $searchTerm).padding().overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 1)).foregroundColor(.white).padding()
                    Button(action: {
                        self.showFilterPeopleContentView = true
                    }, label: {
                        Image(systemName: "slider.horizontal.3").font(.system(size: 25, weight: .regular)).foregroundColor(.white)
                    }).sheet(isPresented: $showFilterPeopleContentView) {
                        FilterPeopleContentView()
                    }
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "magnifyingglass").font(.system(size: 25, weight: .regular)).foregroundColor(.white)
                    }).padding(.trailing, 20)
                }
                
                List {
                    ForEach(0..<5) { card in
                        DiscoverPeopleCardContentView(bgImage: .constant(Constants.discoverPeopleCard1), username: .constant("painforever"))
                    }
                }
//                ForEach(0..<5) { card in
//                    DiscoverPeopleCardContentView(bgImage: .constant(Constants.discoverPeopleCard1), username: .constant("painforever"))
//                }
                
            }
            
        }
    }
}

struct DiscoverContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverContentView()
    }
}
