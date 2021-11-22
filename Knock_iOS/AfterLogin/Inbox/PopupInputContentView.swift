//
//  PopupInputContentView.swift
//  Knock_iOS
//
//  Created by yusong on 11/10/21.
//

import SwiftUI
import Alamofire

struct PopupInputContentView: View {
    @State var content: String = ""
    @Binding var knockId: Int
    @State var isLoading = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color(Constants.themeColor)).ignoresSafeArea()
            LoadingView(isShowing: $isLoading, text: "Submitting...") {
                VStack {
                    TextField("Saying something...", text: $content).modifier(ThemeTextField())
                    Button(action: {
                        isLoading = true
                        if let userId = UserDefaults.standard.value(forKey: Constants.userId) {
                            AF.request("\(Constants.BaseUrl)/knocks/\(knockId)/knock_messages", method: .post, parameters: ["knock_message": ["user_id": userId, "message": content, "state": 1]]).responseJSON { data in
                                presentationMode.wrappedValue.dismiss()
                                isLoading = false
                            }
                        }
                        
                    }, label: {
                        Text("Submit").themeButton(height: 50)
                    })
                }
            }
        }
    }
}

struct PopupInputContentView_Previews: PreviewProvider {
    static var previews: some View {
        PopupInputContentView(knockId: .constant(1))
    }
}
