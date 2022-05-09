//
//  ContentView.swift
//  my map swiftUI
//
//  Created by Аркадий Торвальдс on 30.04.2022.
//

import Foundation
import SwiftUI
import RealmSwift
import MapKit

struct ContentView: View {
    let realm: Realm
    
    var body: some View {
        TabView{
            MapController().tabItem {Text("Карта")}
            TracksController(realm: realm).tabItem{Text("Треки")}
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(realm: try! Realm())
    }
}
