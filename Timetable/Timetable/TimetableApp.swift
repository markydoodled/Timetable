//
//  TimetableApp.swift
//  Timetable
//
//  Created by Mark Howard on 26/10/2022.
//

import SwiftUI

@main
struct TimetableApp: App {
    let persistence = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 950, maxWidth: .infinity, minHeight: 480, maxHeight: .infinity)
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
        .windowToolbarStyle(UnifiedWindowToolbarStyle(showsTitle: true))
        .onChange(of: scenePhase) { _ in
            persistence.save()
        }
        .commands {
            SidebarCommands()
        }
        Settings {
            SettingsView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
    }
}
