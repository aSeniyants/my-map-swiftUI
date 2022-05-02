//
//  ContentView.swift
//  my map swiftUI
//
//  Created by Аркадий Торвальдс on 30.04.2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    var body: some View {
        TabView{
            MapController().tabItem {Text("Карта")}
            TracksController().tabItem{Text("Треки")}
        }.background(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
