//
//  LocationContentView.swift
//  Knock_iOS
//
//  Created by yusong on 11/4/21.
//

import SwiftUI
import MapKit

struct LocationContentView: View {
    let defaultLat = 39.0504463
    let defaultLon = -77.5046096
    @State var locationText: String = ""
    @StateObject var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 39.0504463, longitude: -77.5046096), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter you location..", text: self.$locationText)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.white), lineWidth: 2))
                    .foregroundColor(.white)
                Button(action: {
                    
                }, label: {
                    Text("Search").padding().background(Color(Constants.themeColor)).cornerRadius(10).foregroundColor(.white)
                })
            }.padding()
            
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .accentColor(Color(.systemPink))
                .frame(width: 400, height: 300)
                .cornerRadius(10)
                .onAppear {
                    self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.locationManager.lastLocation?.coordinate.latitude ?? self.defaultLat, longitude: self.locationManager.lastLocation?.coordinate.longitude ?? self.defaultLon), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
                }
        }
        
    }
}

struct LocationContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationContentView()
    }
}
