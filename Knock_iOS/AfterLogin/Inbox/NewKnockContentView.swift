//
//  NewKnockContentView.swift
//  Knock_iOS
//
//  Created by yusong on 12/15/21.
//

import SwiftUI
import Alamofire

extension NewKnockContentView {
    class NewKnockViewModel: ObservableObject {
        @Published var to = ""
        @Published var title = ""
        @Published var content = "Knock Knock, Your message here..."
        @Published var price: Double = 0.0
        @Published var meetingMethod: String = "phone"
        @Published var knockType: String = ""
        @Published var isKnockTypeOpen = false
    }
}
struct NewKnockContentView: View {
    @ObservedObject var viewModel: NewKnockViewModel = NewKnockViewModel()
    var body: some View {
        VStack {
            Group {
                TextField("To", text: $viewModel.to).onChange(of: viewModel.to) { value in
                    print("DEBUG: \(value)")
                }
                List {
                    ForEach((1...5), id: \.self) {
                        Text("terrorgeek\($0)@gmail.com")
                    }
                }.listStyle(PlainListStyle())
                
                underline()
                TextField("Subject", text: $viewModel.title)
                underline()
                TextEditor(text: $viewModel.content)
            }
            
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
            
            Group {
                Divider().background(Color(.white))
                
                HStack(alignment: .center, spacing: 5) {
                    Button(action: {
                        viewModel.isKnockTypeOpen = true
                    }, label: {
                        Text(viewModel.knockType == "" ? "Knock Type" : viewModel.knockType).themeButton(height: 50)
                        
                    }).sheet(isPresented: $viewModel.isKnockTypeOpen) {
                        KnockTypesContentView(newKnockViewModel: viewModel)
                    }
                    showKnockTypeImage()
                }
                
                Divider().background(Color(.white))
            }
            
            
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
            
            VStack {
                Button(action: {
                    
                }, label: {
                    Text("Create").themeButton(height: 30)
                })
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
    
    func createKnock() {
        if let user_id = UserDefaults.standard.string(forKey: Constants.userId) {
            AF.request("\(Constants.BaseUrl)/knocks", method: .post,
                       parameters: [
                        "knock": [
                            "user_id": user_id,
                            "subject": viewModel.title,
                            "knock_type": viewModel.knockType,
                            "knockee_id": "17"
                          ],
                        "knock_message": [
                            "message": viewModel.content,
                            "user_id": user_id,
                            "state": 1
                        ]
                       ]).responseJSON { data in
                           
                       }
        }
    }
    
    @ViewBuilder
    func showKnockTypeImage() -> some View {
        if viewModel.knockType == "" {
            EmptyView()
        }
        else {
            Image(viewModel.knockType).resizable().frame(width: 50, height: 50)
        }
    }
}

struct NewKnockContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewKnockContentView()
    }
}
