//
//  LocationContentView.swift
//  Knock_iOS
//
//  Created by yusong on 11/4/21.
//

import SwiftUI
import MapKit

extension LocationContentView {
    struct Location: Identifiable {
        let id = UUID()
        var coordinate: CLLocationCoordinate2D
    }
    static let defaultLat = 39.0504463
    static let defaultLon = -77.5046096
}

struct LocationContentView: View {
    
    @State var locationText: String = ""
    //@StateObject var locationManager = LocationManager()
    @ObservedObject var locationManager: LocationManager
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Self.defaultLat, longitude: Self.defaultLon), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    var places: [Location] = [
        Location(coordinate: CLLocationCoordinate2D(latitude: defaultLat, longitude: defaultLon))
    ]
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
            
            ScrollView {
                Map(coordinateRegion: $region, annotationItems: places) { place in
                    MapPin(coordinate: place.coordinate)
                }.accentColor(Color(.systemPink))
                .frame(width: 400, height: 300)
                .cornerRadius(10)
                
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .accentColor(Color(.systemPink))
                    .frame(width: 400, height: 300)
                    .cornerRadius(10)
                    .onAppear {
                        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.locationManager.lastLocation?.coordinate.latitude ?? Self.defaultLat, longitude: self.locationManager.lastLocation?.coordinate.longitude ?? Self.defaultLon), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
                    }
            }
            
        }
        
    }
}

struct LocationContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationContentView(locationManager: LocationManager())
    }
}
