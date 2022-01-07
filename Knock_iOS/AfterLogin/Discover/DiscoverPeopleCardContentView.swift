//
//  DiscoverPeopleCard.swift
//  Knock_iOS
//
//  Created by yusong on 10/29/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DiscoverPeopleCardContentView: View {
    @Binding var person: Person
    @Binding var bgImage: String
    
    let cardHeight: CGFloat = 250
    let cardWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            HStack {
                AnimatedImage(url: URL(string: person.s3AvatarPhoto)).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color(.lightGray), lineWidth: 1))
                    .cornerRadius(50)
                    .padding(.horizontal, 20)
                    .padding()
                Spacer()
                VStack {
                    VStack {
                        displayDNAs()
                    }
                    HStack {
                        Text("$\(person.price)/hr").foregroundColor(Color(Constants.themeColor))
                        Image("get_in_touch").resizable().frame(width: 30, height: 30).foregroundColor(.white)
                    }
                    .padding(.horizontal, 20)
                }
            }
            
            Divider()
            
            HStack {
                VStack {
                    Text(person.username).bold().font(.system(size: 30))
                    Text(person.occupation)
                }
                Spacer()
                VStack {
                    Text("\(person.locationAcceptedDistance) mi away")
                    Text(person.city)
                }
            }
            .padding(.horizontal, 20)
            .background(Color.white)
        }
        .frame(height: cardHeight)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(Constants.themeColor), lineWidth: 5))
        .cornerRadius(10)
    }
    
    func displayDNAs() -> some View {
        var dnas = person.dnas.components(separatedBy: ",")
        dnas = Array(dnas.prefix(3))
        return ForEach(dnas, id: \.self) {
            Text($0).themeDNA().padding(.horizontal, 10)
        }
    }
}

struct DiscoverPeopleCardContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverPeopleCardContentView(person: .constant(Person(username: "Painforever", city: "Arlington", price: "34.88", occupation: "Poker in Carousel", locationAcceptedDistance: "4.7", dnas: "Sports, Games", s3AvatarPhoto: "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png")), bgImage: .constant(Constants.discoverPeopleCard1))
    }
}
