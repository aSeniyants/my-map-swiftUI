//
//  MapView.swift
//  my map swiftUI
//
//  Created by Аркадий Торвальдс on 01.05.2022.
//

import Foundation
import SwiftUI
import MapKit

struct MapController : View {
    
    @StateObject private var ViewModel = MapViewModel()
    
    var body: some View{
        
        ZStack{
            Map(coordinateRegion: $ViewModel.region, showsUserLocation: true)
                        .onAppear{
                            ViewModel.checkIfLocationServicesIsEnable()
                        }
                        .accentColor(Color(.systemPink))
            HStack {
                Spacer()
                VStack {
                    Button(action: {print("plus")}) {
                        ZStack{
                            Circle()
                                .foregroundColor(.white)
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                        }.frame(width: 50, height: 50)
                    }
                    Button(action: {print("minus")}) {
                        ZStack{
                            Circle()
                                .foregroundColor(.white)
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                        }.frame(width: 50, height: 50)
                    }
                    Button(action: {print("rec")}) {
                        ZStack{
                            Circle()
                                .foregroundColor(.white)
                            Image(systemName: "record.circle")
                                .foregroundColor(.red)
                                .font(.system(size: 40))
                        }.frame(width: 50, height: 50)
                    }
                    Button(action: {print("center")
                        
                    }) {
                        ZStack{
                            Circle()
                                .foregroundColor(.white)
                            Image(systemName: "location.north.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                        }.frame(width: 50, height: 50)
                    }
            }
        }
}
    }
    final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
        
        @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 28.28, longitude: 35.35), span: MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3))
        
        var locationManager: CLLocationManager?
        
        func checkIfLocationServicesIsEnable() {
            if CLLocationManager.locationServicesEnabled() {
                locationManager = CLLocationManager()
                locationManager!.delegate = self
            } else {
                print("доступ запрещен")
            }
        }
        private func checkLocationAuthorization() {
            print("checkLocationAuthorization start")
            guard let locationManager = locationManager else { return }
            switch locationManager.authorizationStatus {
                
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print(".restricted")
            case .denied:
                print(".denided")
            case .authorizedAlways, .authorizedWhenInUse:
                region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3))
            @unknown default:
                break
            }
        }
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            checkLocationAuthorization()
        }
        
    }

    //----------------------------
//struct naviButton: ButtonStyle {
//    func makeBody(configuration: Self.Configuration) -> some View {
//        configuration.label
//            .frame(width: 50, height: 50)
//            .foregroundColor(Color.black)
//            .background(Color.white)
//            .clipShape(Circle())
//    }
//}
    //----------------------------
}

