//
//  FilterPeopleViewModel.swift
//  Knock_iOS
//
//  Created by yusong on 11/17/21.
//

import Foundation
import SwiftUI

class FilterPeopleViewModel: ObservableObject {
    @Published var lat: String = ""
    @Published var lon: String = ""
    @Published var address: String = ""
    @Published var price: Double = 0.0
    @Published var meetingMethod: String = ""
    @Published var filterClicked: Bool = false
    @Published var isLoading = false
}
