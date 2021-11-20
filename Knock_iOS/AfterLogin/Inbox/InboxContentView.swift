//
//  InboxContentView.swift
//  Knock_iOS
//
//  Created by yusong on 11/7/21.
//

import SwiftUI
import Alamofire

struct InboxContentView: View {
    @State var knocksData: [KnockResponse] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach($knocksData) { knock in
                    KnockCardContentView(knockResponse: knock).background(NavigationLink(destination: ConversationContentView(knockId: knock.knockId, username: knock.username)){})
                }
            }
            .onAppear {
                if let user_id = UserDefaults.standard.string(forKey: Constants.userId) {
                    AF.request("\(Constants.BaseUrl)/knocks.json", method: .get, parameters: ["user_id": user_id]).responseJSON { data in
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                        let json = try! jsonDecoder.decode([KnockResponse].self, from: data.data!)
                        knocksData = json
                    }
                }
            }
            .navigationBarTitle(Text("Inbox"), displayMode: .large)
        }
    }
}

struct InboxContentView_Previews: PreviewProvider {
    static var previews: some View {
        InboxContentView()
    }
}
