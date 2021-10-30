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
    let cardWidth: CGFloat = UIScreen.main.bounds.width - 30
    
    var body: some View {
        VStack {
            HStack {
                AnimatedImage(url: URL(string: "https://st3.depositphotos.com/1007566/13175/v/600/depositphotos_131750410-stock-illustration-woman-female-avatar-character.jpg")).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                    .cornerRadius(50)
                    .padding(.horizontal, 20)
                    .padding()
                Spacer()
                VStack {
                    Text("$52/hr").foregroundColor(.white)
                    Image("get_in_touch").resizable().frame(width: 30, height: 30).foregroundColor(.white)
                }
                .padding(.horizontal, 20)
                
            }.background(Color(Constants.themeColor))
            
            
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
            .frame(width: cardWidth, height: 100)
            .background(Color.white)
        }
        .cornerRadius(10)
    }
}

struct DiscoverPeopleCardContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverPeopleCardContentView(bgImage: .constant(Constants.discoverPeopleCard1), username: .constant("painforever"))
    }
}
