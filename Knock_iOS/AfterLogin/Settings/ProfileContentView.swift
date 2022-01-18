//
//  ProfileContentView.swift
//  Knock_iOS
//
//  Created by yusong on 1/17/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileContentView: View {
    var body: some View {
        ScrollView {
            GeometryReader { g in
                VStack {
                    VStack {
                        VStack {
                            AnimatedImage(url: URL(string: "https://media-exp1.licdn.com/dms/image/C5103AQG1h4gxBsRAeg/profile-displayphoto-shrink_200_200/0/1516871913633?e=1648080000&v=beta&t=9WOQ0cL5n3_zU-ECXx9UGsmVF76ZMPJmLqYFeBEu4ww")).resizable().frame(width: 150, height: 150).cornerRadius(75)
                            Text("#username").bold()
                            HStack {
                                Image(systemName: "location.circle.fill")
                                Text("1600 S Joyce St, Arlington, VA")
                            }
                        }
                        HStack {
                            Text("Total Meetings: \(45)")
                            Spacer()
                            HStack(spacing: 2) {
                                Text("Rating: ")
                                ForEach(1..<5, id: \.self) { number in
                                    Image(systemName: "star.fill").resizable().frame(width: 20, height: 20).foregroundColor(.yellow)
                                }
                            }
                        }.padding()
                        HStack {
                            Text("Satisfaction: \(87)%")
                            Spacer()
                            Text("Total hours: \(341) hrs")
                        }.padding()
                    }
                    .frame(width: g.size.width, height: g.size.height * 0.45)
                    .background(Color(Constants.themeColor))
                    .foregroundColor(.white)
                    
                    VStack(spacing: 30) {
                        HStack(spacing: 30) {
                            OperationCellContentView(icon: .constant("knock"), title: .constant("Send Knock"), sideLength: .constant(130))
                            OperationCellContentView(icon: .constant("message"), title: .constant("Send Message"), sideLength: .constant(130))
                        }
                        DNAsContentView()
                        Spacer()
                        
                    }
                    .frame(width: g.size.width, height: g.size.height * 0.55)
                }
            }.frame(height: UIScreen.main.bounds.height)
        }.ignoresSafeArea()
    }
}

struct ProfileContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileContentView()
    }
}
