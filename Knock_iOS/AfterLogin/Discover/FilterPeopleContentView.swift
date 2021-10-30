//
//  FilterPeopleContentView.swift
//  Knock_iOS
//
//  Created by yusong on 10/30/21.
//

import SwiftUI

struct FilterPeopleContentView: View {
    @State var price = 10.00
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color(Constants.themeColor)).ignoresSafeArea()
            VStack {
                HStack {
                    Text("Location")
                    Spacer()
                    Text("1600 S Joyce St, Arlington, VA")
                    Image(systemName: "arrowtriangle.forward.fill").font(.system(size: 16, weight: .regular))
                }
                .padding(20)
                .foregroundColor(.white)
                
                Divider().background(Color(.white))
                
                VStack {
                    HStack {
                        Text("Price (per hour)")
                        Spacer()
                        Text("$0.00 - $90.00")
                    }
                    HStack {
                        Button(action: {
                            
                        }, label: {
                            Text("Free")
                        })
                        Divider().background(Color(.white))
                        Button(action: {
                            
                        }, label: {
                            Text("Range")
                        })
                        Slider(value: $price, in: 0...10000, onEditingChanged: {_ in })
                    }
                }
                .foregroundColor(.white)
                .padding(20)
                .frame(height: 120)
                
                Divider().background(Color(.white))
                
                VStack {
                    HStack {
                        Text("Meeting Methods")
                        Spacer()
                    }.padding()
                    HStack(spacing: 60) {
                        VStack {
                            Image(systemName: "phone.fill").font(.system(size: 16, weight: .regular))
                            Text("Phone")
                        }
                        VStack {
                            Image(systemName: "video.fill").font(.system(size: 16, weight: .regular))
                            Text("Video")
                        }
                        VStack {
                            Image(systemName: "person.fill").font(.system(size: 16, weight: .regular))
                            Text("In-Person")
                        }
                    }
                }.foregroundColor(.white)
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Filter").foregroundColor(.white).padding().overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1)).foregroundColor(.white)
                })
            }
        }
    }
}

struct FilterPeopleContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilterPeopleContentView()
    }
}
