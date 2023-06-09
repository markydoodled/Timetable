//
//  Timetable_iOSApp.swift
//  Timetable iOS
//
//  Created by Mark Howard on 26/10/2022.
//

import SwiftUI

//Define The Main App Struct
@main
struct Timetable_iOSApp: App {
    //Create An Instance Of The Persistence Controller
    let persistence = PersistenceController.shared
    //Get The Current Scene Phase From The Environment
    @Environment(\.scenePhase) var scenePhase
    //Define The App's Body
    var body: some Scene {
        //Create A Window Group
        WindowGroup {
            //Set The Content View To The Main App View
            ContentView()
                //Inject The Managed Object Context Into The View
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
        //When The Scene Phase Changes, Save The Persistence Controller
        .onChange(of: scenePhase) { _ in
            persistence.save()
        }
    }
}
