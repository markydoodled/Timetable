//
//  Timetable_iOSApp.swift
//  Timetable iOS
//
//  Created by Mark Howard on 26/10/2022.
//

import SwiftUI

@main
struct Timetable_iOSApp: App {
    let persistence = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistence.save()
        }
    }
}
