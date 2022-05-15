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
    @State var isOn: Bool = false
    
    var body: some View{
        NavigationView{
            VStack {
                
                listView
                
                Button(action: {
                    print("refresh")
                    let trackListTable = realm.objects(trackList.self)
                    print(trackListTable)
                }) {
                    Text("Распечатать")
                }
            }
        }
    }
    
    private var listView: some View {
        List {
            ForEach(realm.objects(trackList.self), id: \.self) { elem in
                    Text(String(elem.coordinates.count))
            }.onDelete(perform: deleteRow)
        }
    }
    
//    func doBendingBool(value: Bool) -> Binding<Bool> {
//        let BendingVar = Binding<Bool>(
//            get: { value },
//            set: { $0 }
//        )
//        return BendingVar
//    }
    
    private func deleteRow(at offsets: IndexSet) {
        print(offsets)
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
    @objc dynamic var isDraw: Bool = false
}
