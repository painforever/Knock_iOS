//
//  InboxContentView.swift
//  Knock_iOS
//
//  Created by yusong on 11/7/21.
//

import SwiftUI
import Alamofire

struct InboxContentView: View {
    @State var knocksData = [KnockResponse]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach($knocksData, id: \.self) { knock in
                    MessageCardContentView(knockResponse: knock).background(NavigationLink(destination: ConversationContentView()){})
                }
            }
            .onAppear {
                if let user_id = UserDefaults.standard.string(forKey: Constants.userId) {
                    AF.request("\(Constants.BaseUrl)/knocks.json", method: .get, parameters: ["user_id": user_id]).responseJSON { data in
                        let jsonDecoder = JSONDecoder()
                        let json = try! jsonDecoder.decode([KnockResponse].self, from: data.data!)
                        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
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
