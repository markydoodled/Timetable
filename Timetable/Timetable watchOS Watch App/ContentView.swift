//
//  ContentView.swift
//  Timetable watchOS Watch App
//
//  Created by Mark Howard on 26/10/2022.
//

import SwiftUI
import CoreData
import UserNotifications

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Monday.entity(),
                  sortDescriptors: [],
            animation: .default)
    private var items: FetchedResults<Monday>
    @FetchRequest(entity: Tuesday.entity(),
                  sortDescriptors: [],
            animation: .default)
    private var items2: FetchedResults<Tuesday>
    @FetchRequest(entity: Wednesday.entity(),
                  sortDescriptors: [],
            animation: .default)
    private var items3: FetchedResults<Wednesday>
    @FetchRequest(entity: Thursday.entity(),
                  sortDescriptors: [],
            animation: .default)
    private var items4: FetchedResults<Thursday>
    @FetchRequest(entity: Friday.entity(),
                  sortDescriptors: [],
            animation: .default)
    private var items5: FetchedResults<Friday>
    @State var showingNotificationAlert = false
    @State var addDisabled = true
    @State var titleText = ""
    @State var locationText = ""
    @State var notesText = ""
    @State var selectedDay = 1
    @State var showingAdd = false
    //Main View
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Label("Monday", systemImage: "1.circle")) {
                    ForEach(items) { item in
                        NavigationLink(destination: detail.onAppear() {
                            self.titleText = item.title ?? "Error"
                            self.locationText = item.location ?? "Error"
                            self.notesText = item.notes ?? "Error"
                            self.selectedDay = Int(item.day)
                        }
                            .onDisappear() {
                                self.titleText = ""
                                self.locationText = ""
                                self.notesText = ""
                                self.selectedDay = 1
                            }) {
                            VStack(alignment: .leading) {
                                Text(item.title ?? "Error")
                                    .bold()
                                    .font(.system(.title2, design: .rounded))
                                    .foregroundColor(.red)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.system(.title3, design: .rounded))
                                }
                            }
                        }
                    }
                    .onDelete { indexSet in
                            for index in indexSet {
                                managedObjectContext.delete(items[index])
                            }
                            PersistenceController.shared.save()
                        }
                }
                Section(header: Label("Tuesday", systemImage: "2.circle")) {
                    ForEach(items2) { item in
                        NavigationLink(destination: detail.onAppear() {
                            self.titleText = item.title ?? "Error"
                            self.locationText = item.location ?? "Error"
                            self.notesText = item.notes ?? "Error"
                            self.selectedDay = Int(item.day)
                        }
                            .onDisappear() {
                                self.titleText = ""
                                self.locationText = ""
                                self.notesText = ""
                                self.selectedDay = 1
                            }) {
                            VStack(alignment: .leading) {
                                Text(item.title ?? "Error")
                                    .bold()
                                    .font(.system(.title2, design: .rounded))
                                    .foregroundColor(.orange)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.system(.title3, design: .rounded))
                                }
                            }
                        }
                    }
                    .onDelete { indexSet in
                            for index in indexSet {
                                managedObjectContext.delete(items2[index])
                            }
                            PersistenceController.shared.save()
                        }
                }
                Section(header: Label("Wednesday", systemImage: "3.circle")) {
                    ForEach(items3) { item in
                        NavigationLink(destination: detail.onAppear() {
                            self.titleText = item.title ?? "Error"
                            self.locationText = item.location ?? "Error"
                            self.notesText = item.notes ?? "Error"
                            self.selectedDay = Int(item.day)
                        }
                            .onDisappear() {
                                self.titleText = ""
                                self.locationText = ""
                                self.notesText = ""
                                self.selectedDay = 1
                            }) {
                            VStack(alignment: .leading) {
                                Text(item.title ?? "Error")
                                    .bold()
                                    .font(.system(.title2, design: .rounded))
                                    .foregroundColor(.yellow)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.system(.title3, design: .rounded))
                                }
                            }
                        }
                    }
                    .onDelete { indexSet in
                            for index in indexSet {
                                managedObjectContext.delete(items3[index])
                            }
                            PersistenceController.shared.save()
                        }
                }
                Section(header: Label("Thursday", systemImage: "4.circle")) {
                    ForEach(items4) { item in
                        NavigationLink(destination: detail.onAppear() {
                            self.titleText = item.title ?? "Error"
                            self.locationText = item.location ?? "Error"
                            self.notesText = item.notes ?? "Error"
                            self.selectedDay = Int(item.day)
                        }
                            .onDisappear() {
                                self.titleText = ""
                                self.locationText = ""
                                self.notesText = ""
                                self.selectedDay = 1
                            }) {
                            VStack(alignment: .leading) {
                                Text(item.title ?? "Error")
                                    .bold()
                                    .font(.system(.title2, design: .rounded))
                                    .foregroundColor(.green)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.system(.title3, design: .rounded))
                                }
                            }
                        }
                    }
                    .onDelete { indexSet in
                            for index in indexSet {
                                managedObjectContext.delete(items4[index])
                            }
                            PersistenceController.shared.save()
                        }
                }
                Section(header: Label("Friday", systemImage: "5.circle")) {
                    ForEach(items5) { item in
                        NavigationLink(destination: detail.onAppear() {
                            self.titleText = item.title ?? "Error"
                            self.locationText = item.location ?? "Error"
                            self.notesText = item.notes ?? "Error"
                            self.selectedDay = Int(item.day)
                        }
                            .onDisappear() {
                                self.titleText = ""
                                self.locationText = ""
                                self.notesText = ""
                                self.selectedDay = 1
                            }) {
                            VStack(alignment: .leading) {
                                Text(item.title ?? "Error")
                                    .bold()
                                    .font(.system(.title2, design: .rounded))
                                    .foregroundColor(.blue)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.system(.title3, design: .rounded))
                                }
                            }
                        }
                    }
                    .onDelete { indexSet in
                            for index in indexSet {
                                managedObjectContext.delete(items5[index])
                            }
                            PersistenceController.shared.save()
                        }
                }
                Button(action: {self.showingAdd = true}) {
                    Label("Add", systemImage: "plus")
                        .foregroundColor(.accentColor)
                }
                .sheet(isPresented: $showingAdd) {
                    add
                }
                NavigationLink(destination: settings) {
                    Label("Settings", systemImage: "gearshape")
                }
            }
            .navigationTitle("Timetable")
        }
    }
    //Detail View
    var detail: some View {
        Form {
            Section(header: Label("Title", systemImage: "textformat")) {
                Text("\(titleText)")
            }
            Section(header: Label("Location", systemImage: "location.fill")) {
                Text("\(locationText)")
            }
            Section(header: Label("Day", systemImage: "calendar")) {
                if selectedDay == 1 {
                    Text("Monday")
                } else if selectedDay == 2 {
                    Text("Tuesday")
                } else if selectedDay == 3 {
                    Text("Wednesday")
                } else if selectedDay == 4 {
                    Text("Thursday")
                } else if selectedDay == 5 {
                    Text("Friday")
                } else {
                    Text("Day Error")
                }
            }
            Section(header: Label("Notes", systemImage: "note.text")) {
                Text("\(notesText)")
            }
            ShareLink(item: "\(titleText)\n\(locationText)\n\(notesText)")
        }
            .navigationTitle("\(titleText)")
    }
    //Add View
    var add: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $titleText)
                    TextField("Location", text: $locationText)
                }
                Section {
                    Picker("Day", selection: $selectedDay) {
                        Text("Monday")
                            .tag(1)
                        Text("Tuesday")
                            .tag(2)
                        Text("Wednesday")
                            .tag(3)
                        Text("Thursday")
                            .tag(4)
                        Text("Friday")
                            .tag(5)
                    }
                }
                Section {
                    TextField("Notes", text: $notesText, axis: .vertical)
                        .lineLimit(5)
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        self.titleText = ""
                        self.locationText = ""
                        self.notesText = ""
                        self.selectedDay = 1
                        self.showingAdd = false
                    }) {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        if selectedDay == 1 {
                            let data = Monday(context: managedObjectContext)
                            data.title = titleText
                            data.location = locationText
                            data.notes = notesText
                            data.day = Int64(selectedDay)
                            PersistenceController.shared.save()
                        } else if selectedDay == 2 {
                            let data = Tuesday(context: managedObjectContext)
                            data.title = titleText
                            data.location = locationText
                            data.notes = notesText
                            data.day = Int64(selectedDay)
                            PersistenceController.shared.save()
                        } else if selectedDay == 3 {
                            let data = Wednesday(context: managedObjectContext)
                            data.title = titleText
                            data.location = locationText
                            data.notes = notesText
                            data.day = Int64(selectedDay)
                            PersistenceController.shared.save()
                        } else if selectedDay == 4 {
                            let data = Thursday(context: managedObjectContext)
                            data.title = titleText
                            data.location = locationText
                            data.notes = notesText
                            data.day = Int64(selectedDay)
                            PersistenceController.shared.save()
                        } else if selectedDay == 5 {
                            let data = Friday(context: managedObjectContext)
                            data.title = titleText
                            data.location = locationText
                            data.notes = notesText
                            data.day = Int64(selectedDay)
                            PersistenceController.shared.save()
                        } else {
                            print("Error Day Range")
                        }
                        self.titleText = ""
                        self.locationText = ""
                        self.notesText = ""
                        self.selectedDay = 1
                        self.showingAdd = false
                    }) {
                        Text("Done")
                    }
                    .disabled(addDisabled)
                }
            }
            .toolbarRole(.navigationStack)
            .onChange(of: titleText) { newValue in
                if titleText != "" {
                    addDisabled = false
                } else {
                    addDisabled = true
                }
            }
        }
        .onAppear() {
            if titleText == "" {
                addDisabled = true
            }
        }
    }
    //Settings View
    var settings: some View {
        NavigationStack {
            Form {
                Section(header: Label("Permissions", systemImage: "lock")) {
                    Button(action: {UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("Authorised")
                            self.showingNotificationAlert = true
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                        let content = UNMutableNotificationContent()
                        content.title = "Happening First Today"
                        if selectedDay == 1 {
                            content.subtitle = "Monday - \(items.first?.title ?? "None")"
                        } else if selectedDay == 2 {
                            content.subtitle = "Tuesday - \(items2.first?.title ?? "None")"
                        } else if selectedDay == 3 {
                            content.subtitle = "Wednesday - \(items3.first?.title ?? "None")"
                        } else if selectedDay == 4 {
                            content.subtitle = "Thursday - \(items4.first?.title ?? "None")"
                        } else if selectedDay == 5 {
                            content.subtitle = "Friday - \(items5.first?.title ?? "None")"
                        } else {
                            content.subtitle = "Not A Weekday Today"
                        }
                        content.sound = UNNotificationSound.default
                        var date = DateComponents()
                        date.hour = 9
                        date.minute = 0
                        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        UNUserNotificationCenter.current().add(request)
                    }) {
                        Text("Request Notification Permissions")
                    }
                    .alert("Authorised Notifications", isPresented: $showingNotificationAlert) {
                        Button(action: {self.showingNotificationAlert = false}) {
                            Text("Done")
                        }
                    }
                    Button(action: {UNUserNotificationCenter.current().removeAllPendingNotificationRequests()}) {
                        Text("Clear All Scheduled Notifications")
                    }
                }
                Section(header: Label("Misc.", systemImage: "ellipsis.circle")) {
                    LabeledContent("Version") {
                        Text("1.1")
                    }
                    LabeledContent("Build") {
                        Text("6")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
