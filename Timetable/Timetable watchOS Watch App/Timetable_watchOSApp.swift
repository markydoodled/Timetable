//
//  Timetable_watchOSApp.swift
//  Timetable watchOS Watch App
//
//  Created by Mark Howard on 26/10/2022.
//

import SwiftUI

@main
struct Timetable_watchOS_Watch_AppApp: App {
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
