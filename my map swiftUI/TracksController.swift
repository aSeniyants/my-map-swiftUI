//
//  TracksView.swift
//  my map swiftUI
//
//  Created by Аркадий Торвальдс on 01.05.2022.
//

import Foundation
import SwiftUI
import RealmSwift
import MapKit

struct TracksController: View {
    let realm: Realm
    
    var body: some View{
        NavigationView{
            VStack {
                listView()
                Button(action: {
                    print("refresh")
//                    let trackListTable = realm.objects(trackList.self)
//                    print(trackListTable.count)
                }) {
                    Text("Обновить")
                }
            }
    }
}

    struct listView: View {
        
        var body: some View {
            SwiftUI.List {
                ForEach(try! Realm().objects(trackList.self) , id: \.self) { elem in
                    Text(String(elem.coordinates.count))
                }.onDelete(perform: deleteRow)
            }
        }
                
        func deleteRow(at offsets: IndexSet) {
            print(IndexSet.self)
        }
        
    }
}

class locationList: Object {
    @objc dynamic var latitude = 0.0
    @objc dynamic var longitude = 0.0

    /// Computed properties are ignored in Realm
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude)
    }
}

class trackList: Object {
    let coordinates = RealmSwift.List<locationList>()
    @objc dynamic var nameTrack: String = ""
    }
