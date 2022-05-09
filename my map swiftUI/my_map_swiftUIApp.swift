//
//  my_map_swiftUIApp.swift
//  my map swiftUI
//
//  Created by Аркадий Торвальдс on 30.04.2022.
//

import SwiftUI
import RealmSwift

@main
struct my_map_swiftUIApp: SwiftUI.App {
    private let realm = try! Realm()
    
    var body: some Scene {
        WindowGroup {
            ContentView(realm: realm)
        }
    }
}
