//
//  NewKnockContentView.swift
//  Knock_iOS
//
//  Created by yusong on 12/15/21.
//

import SwiftUI
extension NewKnockContentView {
    class NewKnockViewModel: ObservableObject {
        @Published var to = ""
        @Published var title = ""
        @Published var content = "Knock Knock, Your message here..."
        @Published var price: Double = 0.0
        @Published var meetingMethod: String = "phone"
    }
}
struct NewKnockContentView: View {
    @ObservedObject var viewModel: NewKnockViewModel = NewKnockViewModel()
    var body: some View {
        VStack() {
            TextField("To", text: $viewModel.to)
            underline()
            TextField("Subject", text: $viewModel.title)
            underline()
            TextEditor(text: $viewModel.content)
            
            VStack {
                HStack {
                    Text("Price (per hour)")
                    Spacer()
                    Text("$0.00 - $\(Int(self.viewModel.price)).00")
                }
                HStack {
                    Button(action: {
                        self.viewModel.price = 0
                    }, label: {
                        Text("Free")
                    })
                    Divider()
                    Text("Range")
                    Slider(value: self.$viewModel.price, in: 0...10000, onEditingChanged: {_ in })
                }
            }
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
                        Image(systemName: "phone.fill")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(selectedColor(meetingMethod: "phone"))
                        Text("Phone").foregroundColor(selectedColor(meetingMethod: "phone"))
                    }.onTapGesture {
                        self.viewModel.meetingMethod = "phone"
                    }
                    VStack {
                        Image(systemName: "video.fill")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(selectedColor(meetingMethod: "video"))
                        Text("Video").foregroundColor(selectedColor(meetingMethod: "video"))
                    }.onTapGesture {
                        self.viewModel.meetingMethod = "video"
                    }
                    VStack {
                        Image(systemName: "person.fill")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(selectedColor(meetingMethod: "in-person"))
                        Text("In-Person").foregroundColor(selectedColor(meetingMethod: "in-person"))
                    }.onTapGesture {
                        self.viewModel.meetingMethod = "in-person"
                    }
                }
            }

        }.padding()
    }
    
    @ViewBuilder
    func underline() -> some View {
        Divider()
            .frame(height: 1)
            .padding(.horizontal, 30)
            .background(Color.gray)
    }
    
    func selectedColor(meetingMethod: String) -> Color {
        return viewModel.meetingMethod == meetingMethod ? Color(Constants.themeColor) : Color(.black)
    }
}

struct NewKnockContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewKnockContentView()
    }
}
