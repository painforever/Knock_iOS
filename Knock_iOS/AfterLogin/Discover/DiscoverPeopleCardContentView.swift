//
//  DiscoverPeopleCard.swift
//  Knock_iOS
//
//  Created by yusong on 10/29/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DiscoverPeopleCardContentView: View {
    
    @Binding var bgImage: String
    @Binding var username: String
    let cardHeight: CGFloat = 250
    let cardWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            HStack {
                AnimatedImage(url: URL(string: "https://st3.depositphotos.com/1007566/13175/v/600/depositphotos_131750410-stock-illustration-woman-female-avatar-character.jpg")).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color(.lightGray), lineWidth: 1))
                    .cornerRadius(50)
                    .padding(.horizontal, 20)
                    .padding()
                Spacer()
                
                VStack {
                    Text("Reading").themeDNA()
                    Text("Finance").themeDNA()
                    Text("Weapon").themeDNA()
                }
                
                Spacer()
                
                VStack {
                    Text("$52/hr").foregroundColor(Color(Constants.themeColor))
                    Image("get_in_touch").resizable().frame(width: 30, height: 30).foregroundColor(.white)
                }
                .padding(.horizontal, 20)
            }
            
            Divider()
            
            GeometryReader { g in
                HStack {
                    VStack {
                        Text(self.username).bold().font(.system(size: 30))
                        Text("Stock Broker")
                    }
                    Spacer()
                    VStack {
                        Text("6 mi away")
                        Text("Arlington")
                    }
                }
                .padding(.horizontal, 20)
                .background(Color.white)
            }
        }
        .frame(height: cardHeight)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(Constants.themeColor), lineWidth: 5))
        .cornerRadius(10)
    }
}

struct DiscoverPeopleCardContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverPeopleCardContentView(bgImage: .constant(Constants.discoverPeopleCard1), username: .constant("painforever"))
    }
}
