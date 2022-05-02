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
            
    var body: some View{
        ZStack{
            MapBox()
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
                    Button(action: {print("center")}) {
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
struct MapBox: View, UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //
    }
}

struct naviButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 50, height: 50)
            .foregroundColor(Color.black)
            .background(Color.white)
            .clipShape(Circle())
    }
}
}

