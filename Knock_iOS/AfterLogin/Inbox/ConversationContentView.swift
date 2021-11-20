//
//  ConversationContentView.swift
//  Knock_iOS
//
//  Created by yusong on 11/7/21.
//

import SwiftUI
import Alamofire

struct ConversationContentView: View {
    @State var replyPopupShow: Bool = false
    @State var knockMessagesData = [KnockMessageResponse]()
    @Binding var knockId: Int
    @Binding var username: String
    
    var body: some View {
        List {
            ForEach($knockMessagesData, id: \.self) { knockMessageResponse in
                KnockMessageCardContentView(knockMessageResponse: knockMessageResponse)
            }
        }
        .onAppear {
            AF.request("\(Constants.BaseUrl)/knocks/\(knockId)/knock_messages", method: .get).responseJSON { data in
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let json = try! decoder.decode([KnockMessageResponse].self, from: data.data!)
                self.knockMessagesData = json
            }
        }
        .navigationBarTitle(Text("Conversation with \(username)"), displayMode: .large)
        .navigationBarItems(trailing:
            Button(action: {
                replyPopupShow.toggle()
            }, label: {
                Text("Reply")
                    .foregroundColor(Color(Constants.themeColor))
            }).sheet(isPresented: $replyPopupShow) {
                PopupInputContentView()
            })
    }
}

struct ConversationContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationContentView(knockId: .constant(7), username: .constant("Kitajima"))
    }
}
