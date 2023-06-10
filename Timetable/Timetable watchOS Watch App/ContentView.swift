//
//  ContentView.swift
//  Timetable watchOS Watch App
//
//  Created by Mark Howard on 26/10/2022.
//

import SwiftUI
import CoreData
import UserNotifications
import WatchDatePicker

struct ContentView: View {
    //Fetch Data From The Database
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Monday.entity(), sortDescriptors: [], animation: .default)
    private var items: FetchedResults<Monday>
    @FetchRequest(entity: Tuesday.entity(), sortDescriptors: [], animation: .default)
    private var items2: FetchedResults<Tuesday>
    @FetchRequest(entity: Wednesday.entity(), sortDescriptors: [], animation: .default)
    private var items3: FetchedResults<Wednesday>
    @FetchRequest(entity: Thursday.entity(), sortDescriptors: [], animation: .default)
    private var items4: FetchedResults<Thursday>
    @FetchRequest(entity: Friday.entity(), sortDescriptors: [], animation: .default)
    private var items5: FetchedResults<Friday>
    @FetchRequest(entity: Saturday.entity(), sortDescriptors: [], animation: .default)
    private var items6: FetchedResults<Saturday>
    @FetchRequest(entity: Sunday.entity(), sortDescriptors: [], animation: .default)
    private var items7: FetchedResults<Sunday>
    //Add And Display Detail Variables
    @State var showingNotificationAlert = false
    @State var showingNotificationsClearedAlert = false
    @State var addDisabled = true
    @State var titleText = ""
    @State var titleTextDetail = ""
    @State var locationText = ""
    @State var locationTextDetail = ""
    @State var notesText = ""
    @State var notesTextDetail = ""
    @State var selectedDay = 1
    @State var selectedDayDetail = ""
    @State var selectedTime = Date()
    @State var selectedTimeDetail = ""
    @State var showingAdd = false
    var body: some View {
        NavigationStack {
            List {
                //Monday Task Section
                Section(header: Label("Monday", systemImage: "1.circle")) {
                    ForEach(items) { item in
                        //Navigation Link That Loads Data Into The Detail View
                        NavigationLink(destination: detail
                            .onAppear() {
                                self.titleTextDetail = item.title ?? "Error"
                                self.locationTextDetail = item.location ?? "Error"
                                self.notesTextDetail = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                                if selectedDay == 1 {
                                    selectedDayDetail = "Monday"
                                } else if selectedDay == 2 {
                                    selectedDayDetail = "Tuesday"
                                } else if selectedDay == 3 {
                                    selectedDayDetail = "Wednesday"
                                } else if selectedDay == 4 {
                                    selectedDayDetail = "Thursday"
                                } else if selectedDay == 5 {
                                    selectedDayDetail = "Friday"
                                } else if selectedDay == 6 {
                                    selectedDayDetail = "Saturday"
                                } else if selectedDay == 7 {
                                    selectedDayDetail = "Sunday"
                                } else {
                                    selectedDayDetail = "Day Error"
                                }
                            }
                            .onDisappear() {
                                self.titleTextDetail = ""
                                self.locationTextDetail = ""
                                self.notesTextDetail = ""
                                self.selectedDay = 1
                                self.selectedTimeDetail = ""
                            }) {
                            VStack(alignment: .leading) {
                                Text(item.title ?? "Error")
                                    .bold()
                                    .font(.title2)
                                    .foregroundColor(.red)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.title3)
                                }
                                Text(item.dueTime ?? "Error")
                                    .font(.title3)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    //Delete Task From The Database
                    .onDelete { indexSet in
                        for index in indexSet {
                            managedObjectContext.delete(items[index])
                        }
                        PersistenceController.shared.save()
                    }
                }
                //Tuesday Task Section
                Section(header: Label("Tuesday", systemImage: "2.circle")) {
                    ForEach(items2) { item in
                        //Navigation Link That Loads Data Into The Detail View
                        NavigationLink(destination: detail
                            .onAppear() {
                                self.titleTextDetail = item.title ?? "Error"
                                self.locationTextDetail = item.location ?? "Error"
                                self.notesTextDetail = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                                if selectedDay == 1 {
                                    selectedDayDetail = "Monday"
                                } else if selectedDay == 2 {
                                    selectedDayDetail = "Tuesday"
                                } else if selectedDay == 3 {
                                    selectedDayDetail = "Wednesday"
                                } else if selectedDay == 4 {
                                    selectedDayDetail = "Thursday"
                                } else if selectedDay == 5 {
                                    selectedDayDetail = "Friday"
                                } else if selectedDay == 6 {
                                    selectedDayDetail = "Saturday"
                                } else if selectedDay == 7 {
                                    selectedDayDetail = "Sunday"
                                } else {
                                    selectedDayDetail = "Day Error"
                                }
                            }
                            .onDisappear() {
                                self.titleTextDetail = ""
                                self.locationTextDetail = ""
                                self.notesTextDetail = ""
                                self.selectedDay = 1
                                self.selectedTimeDetail = ""
                            }) {
                            VStack(alignment: .leading) {
                                Text(item.title ?? "Error")
                                    .bold()
                                    .font(.title2)
                                    .foregroundColor(.orange)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.title3)
                                }
                                Text(item.dueTime ?? "Error")
                                    .font(.title3)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    //Delete Task From The Database
                    .onDelete { indexSet in
                        for index in indexSet {
                            managedObjectContext.delete(items2[index])
                        }
                        PersistenceController.shared.save()
                    }
                }
                //Wednesday Task Section
                Section(header: Label("Wednesday", systemImage: "3.circle")) {
                    ForEach(items3) { item in
                        //Navigation Link That Loads Data Into The Detail View
                        NavigationLink(destination: detail
                            .onAppear() {
                                self.titleTextDetail = item.title ?? "Error"
                                self.locationTextDetail = item.location ?? "Error"
                                self.notesTextDetail = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                                if selectedDay == 1 {
                                    selectedDayDetail = "Monday"
                                } else if selectedDay == 2 {
                                    selectedDayDetail = "Tuesday"
                                } else if selectedDay == 3 {
                                    selectedDayDetail = "Wednesday"
                                } else if selectedDay == 4 {
                                    selectedDayDetail = "Thursday"
                                } else if selectedDay == 5 {
                                    selectedDayDetail = "Friday"
                                } else if selectedDay == 6 {
                                    selectedDayDetail = "Saturday"
                                } else if selectedDay == 7 {
                                    selectedDayDetail = "Sunday"
                                } else {
                                    selectedDayDetail = "Day Error"
                                }
                            }
                            .onDisappear() {
                                self.titleTextDetail = ""
                                self.locationTextDetail = ""
                                self.notesTextDetail = ""
                                self.selectedDay = 1
                                self.selectedTimeDetail = ""
                            }) {
                            VStack(alignment: .leading) {
                                Text(item.title ?? "Error")
                                    .bold()
                                    .font(.title2)
                                    .foregroundColor(.yellow)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.title3)
                                }
                                Text(item.dueTime ?? "Error")
                                    .font(.title3)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    //Delete Task From The Database
                    .onDelete { indexSet in
                        for index in indexSet {
                            managedObjectContext.delete(items3[index])
                        }
                        PersistenceController.shared.save()
                    }
                }
                //Thursday Task Section
                Section(header: Label("Thursday", systemImage: "4.circle")) {
                    ForEach(items4) { item in
                        //Navigation Link That Loads Data Into The Detail View
                        NavigationLink(destination: detail
                            .onAppear() {
                                self.titleTextDetail = item.title ?? "Error"
                                self.locationTextDetail = item.location ?? "Error"
                                self.notesTextDetail = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                                if selectedDay == 1 {
                                    selectedDayDetail = "Monday"
                                } else if selectedDay == 2 {
                                    selectedDayDetail = "Tuesday"
                                } else if selectedDay == 3 {
                                    selectedDayDetail = "Wednesday"
                                } else if selectedDay == 4 {
                                    selectedDayDetail = "Thursday"
                                } else if selectedDay == 5 {
                                    selectedDayDetail = "Friday"
                                } else if selectedDay == 6 {
                                    selectedDayDetail = "Saturday"
                                } else if selectedDay == 7 {
                                    selectedDayDetail = "Sunday"
                                } else {
                                    selectedDayDetail = "Day Error"
                                }
                            }
                            .onDisappear() {
                                self.titleTextDetail = ""
                                self.locationTextDetail = ""
                                self.notesTextDetail = ""
                                self.selectedDay = 1
                                self.selectedTimeDetail = ""
                            }) {
                            VStack(alignment: .leading) {
                                Text(item.title ?? "Error")
                                    .bold()
                                    .font(.title2)
                                    .foregroundColor(.green)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.title3)
                                }
                                Text(item.dueTime ?? "Error")
                                    .font(.title3)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    //Delete Task From The Database
                    .onDelete { indexSet in
                        for index in indexSet {
                            managedObjectContext.delete(items4[index])
                        }
                        PersistenceController.shared.save()
                    }
                }
                //Friday Task Section
                Section(header: Label("Friday", systemImage: "5.circle")) {
                    ForEach(items5) { item in
                        //Navigation Link That Loads Data Into The Detail View
                        NavigationLink(destination: detail
                            .onAppear() {
                                self.titleTextDetail = item.title ?? "Error"
                                self.locationTextDetail = item.location ?? "Error"
                                self.notesTextDetail = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                                if selectedDay == 1 {
                                    selectedDayDetail = "Monday"
                                } else if selectedDay == 2 {
                                    selectedDayDetail = "Tuesday"
                                } else if selectedDay == 3 {
                                    selectedDayDetail = "Wednesday"
                                } else if selectedDay == 4 {
                                    selectedDayDetail = "Thursday"
                                } else if selectedDay == 5 {
                                    selectedDayDetail = "Friday"
                                } else if selectedDay == 6 {
                                    selectedDayDetail = "Saturday"
                                } else if selectedDay == 7 {
                                    selectedDayDetail = "Sunday"
                                } else {
                                    selectedDayDetail = "Day Error"
                                }
                            }
                            .onDisappear() {
                                self.titleTextDetail = ""
                                self.locationTextDetail = ""
                                self.notesTextDetail = ""
                                self.selectedDay = 1
                                self.selectedTimeDetail = ""
                            }) {
                            VStack(alignment: .leading) {
                                Text(item.title ?? "Error")
                                    .bold()
                                    .font(.title2)
                                    .foregroundColor(.cyan)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.title3)
                                }
                                Text(item.dueTime ?? "Error")
                                    .font(.title3)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    //Delete Task From The Database
                    .onDelete { indexSet in
                        for index in indexSet {
                            managedObjectContext.delete(items5[index])
                        }
                        PersistenceController.shared.save()
                    }
                }
                //Saturday Task Section
                Section(header: Label("Saturday", systemImage: "6.circle")) {
                    ForEach(items6) { item in
                        //Navigation Link That Loads Data Into The Detail View
                        NavigationLink(destination: detail
                            .onAppear() {
                                self.titleTextDetail = item.title ?? "Error"
                                self.locationTextDetail = item.location ?? "Error"
                                self.notesTextDetail = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                                if selectedDay == 1 {
                                    selectedDayDetail = "Monday"
                                } else if selectedDay == 2 {
                                    selectedDayDetail = "Tuesday"
                                } else if selectedDay == 3 {
                                    selectedDayDetail = "Wednesday"
                                } else if selectedDay == 4 {
                                    selectedDayDetail = "Thursday"
                                } else if selectedDay == 5 {
                                    selectedDayDetail = "Friday"
                                } else if selectedDay == 6 {
                                    selectedDayDetail = "Saturday"
                                } else if selectedDay == 7 {
                                    selectedDayDetail = "Sunday"
                                } else {
                                    selectedDayDetail = "Day Error"
                                }
                            }
                            .onDisappear() {
                                self.titleTextDetail = ""
                                self.locationTextDetail = ""
                                self.notesTextDetail = ""
                                self.selectedDay = 1
                                self.selectedTimeDetail = ""
                            }) {
                            VStack(alignment: .leading) {
                                Text(item.title ?? "Error")
                                    .bold()
                                    .font(.title2)
                                    .foregroundColor(.pink)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.title3)
                                }
                                Text(item.dueTime ?? "Error")
                                    .font(.title3)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    //Delete Task From The Database
                    .onDelete { indexSet in
                        for index in indexSet {
                            managedObjectContext.delete(items6[index])
                        }
                        PersistenceController.shared.save()
                    }
                }
                //Sunday Task Section
                Section(header: Label("Sunday", systemImage: "7.circle")) {
                    ForEach(items7) { item in
                        //Navigation Link That Loads Data Into The Detail View
                        NavigationLink(destination: detail
                            .onAppear() {
                                self.titleTextDetail = item.title ?? "Error"
                                self.locationTextDetail = item.location ?? "Error"
                                self.notesTextDetail = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                                if selectedDay == 1 {
                                    selectedDayDetail = "Monday"
                                } else if selectedDay == 2 {
                                    selectedDayDetail = "Tuesday"
                                } else if selectedDay == 3 {
                                    selectedDayDetail = "Wednesday"
                                } else if selectedDay == 4 {
                                    selectedDayDetail = "Thursday"
                                } else if selectedDay == 5 {
                                    selectedDayDetail = "Friday"
                                } else if selectedDay == 6 {
                                    selectedDayDetail = "Saturday"
                                } else if selectedDay == 7 {
                                    selectedDayDetail = "Sunday"
                                } else {
                                    selectedDayDetail = "Day Error"
                                }
                            }
                            .onDisappear() {
                                self.titleTextDetail = ""
                                self.locationTextDetail = ""
                                self.notesTextDetail = ""
                                self.selectedDay = 1
                                self.selectedTimeDetail = ""
                            }) {
                            VStack(alignment: .leading) {
                                Text(item.title ?? "Error")
                                    .bold()
                                    .font(.title2)
                                    .foregroundColor(.purple)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.title3)
                                }
                                Text(item.dueTime ?? "Error")
                                    .font(.title3)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    //Delete Task From The Database
                    .onDelete { indexSet in
                        for index in indexSet {
                            managedObjectContext.delete(items7[index])
                        }
                        PersistenceController.shared.save()
                    }
                }
                //Button To Show The Add View
                Button(action: {self.showingAdd = true}) {
                    Label("Add", systemImage: "plus")
                        .foregroundColor(.accentColor)
                }
                .sheet(isPresented: $showingAdd) {
                    add
                }
                //Button To Show The Settings View
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
            //Title Detail Text
            Section(header: Label("Title", systemImage: "textformat")) {
                Text("\(titleTextDetail)")
            }
            //Location Detail Text
            if locationTextDetail != "" {
                Section(header: Label("Location", systemImage: "location.fill")) {
                    Text("\(locationTextDetail)")
                }
            }
            //Day Detail Text
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
                } else if selectedDay == 6 {
                    Text("Saturday")
                } else if selectedDay == 7 {
                    Text("Sunday")
                } else {
                    Text("Day Error")
                }
            }
            //Time Detail Text
            Section(header: Label("Time", systemImage: "calendar.badge.clock")) {
                Text("\(selectedTimeDetail)")
            }
            //Notes Detail Text
            if notesTextDetail != "" {
                Section(header: Label("Notes", systemImage: "note.text")) {
                    Text("\(notesTextDetail)")
                }
            }
            //System Share Button To Share The Task
            ShareLink(item: "\(titleTextDetail)\n\(selectedDayDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)\n\(notesTextDetail)")
        }
            .navigationTitle("\(titleTextDetail)")
    }
    //Add View
    var add: some View {
        NavigationStack {
            Form {
                //Text Fields To Add The Title And Location Text
                Section {
                    TextField("Title", text: $titleText)
                    TextField("Location", text: $locationText)
                }
                //Picker To Pick The Task Day
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
                        Text("Saturday")
                            .tag(6)
                        Text("Sunday")
                            .tag(7)
                    }
                    //Time Picker To Select The Task Time
                    DatePicker("Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                }
                //Notes Text Field
                Section {
                    TextField("Notes", text: $notesText, axis: .vertical)
                        .lineLimit(5)
                }
            }
            .toolbar {
                //Button To Dismiss And Reset The Add View
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        self.titleText = ""
                        self.locationText = ""
                        self.notesText = ""
                        self.selectedDay = 1
                        self.selectedTime = Date()
                        self.showingAdd = false
                    }) {
                        Text("Cancel")
                    }
                }
                //Button To Dismiss The Add View, Write To The Database And Reset The Variables
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        if selectedDay == 1 {
                            let data = Monday(context: managedObjectContext)
                            data.title = titleText
                            data.location = locationText
                            data.notes = notesText
                            let selectTime = selectedTime
                            let formatter = DateFormatter()
                            formatter.timeStyle = .short
                            data.dueTime = formatter.string(from: selectTime)
                            data.day = Int64(selectedDay)
                            PersistenceController.shared.save()
                        } else if selectedDay == 2 {
                            let data = Tuesday(context: managedObjectContext)
                            data.title = titleText
                            data.location = locationText
                            data.notes = notesText
                            let selectTime = selectedTime
                            let formatter = DateFormatter()
                            formatter.timeStyle = .short
                            data.dueTime = formatter.string(from: selectTime)
                            data.day = Int64(selectedDay)
                            PersistenceController.shared.save()
                        } else if selectedDay == 3 {
                            let data = Wednesday(context: managedObjectContext)
                            data.title = titleText
                            data.location = locationText
                            data.notes = notesText
                            let selectTime = selectedTime
                            let formatter = DateFormatter()
                            formatter.timeStyle = .short
                            data.dueTime = formatter.string(from: selectTime)
                            data.day = Int64(selectedDay)
                            PersistenceController.shared.save()
                        } else if selectedDay == 4 {
                            let data = Thursday(context: managedObjectContext)
                            data.title = titleText
                            data.location = locationText
                            data.notes = notesText
                            let selectTime = selectedTime
                            let formatter = DateFormatter()
                            formatter.timeStyle = .short
                            data.dueTime = formatter.string(from: selectTime)
                            data.day = Int64(selectedDay)
                            PersistenceController.shared.save()
                        } else if selectedDay == 5 {
                            let data = Friday(context: managedObjectContext)
                            data.title = titleText
                            data.location = locationText
                            data.notes = notesText
                            let selectTime = selectedTime
                            let formatter = DateFormatter()
                            formatter.timeStyle = .short
                            data.dueTime = formatter.string(from: selectTime)
                            data.day = Int64(selectedDay)
                            PersistenceController.shared.save()
                        } else if selectedDay == 6 {
                            let data = Saturday(context: managedObjectContext)
                            data.title = titleText
                            data.location = locationText
                            data.notes = notesText
                            let selectTime = selectedTime
                            let formatter = DateFormatter()
                            formatter.timeStyle = .short
                            data.dueTime = formatter.string(from: selectTime)
                            data.day = Int64(selectedDay)
                            PersistenceController.shared.save()
                        } else if selectedDay == 7 {
                            let data = Sunday(context: managedObjectContext)
                            data.title = titleText
                            data.location = locationText
                            data.notes = notesText
                            let selectTime = selectedTime
                            let formatter = DateFormatter()
                            formatter.timeStyle = .short
                            data.dueTime = formatter.string(from: selectTime)
                            data.day = Int64(selectedDay)
                            PersistenceController.shared.save()
                        } else {
                            print("Error Day Range")
                        }
                        self.titleText = ""
                        self.locationText = ""
                        self.notesText = ""
                        self.selectedDay = 1
                        self.selectedTime = Date()
                        self.showingAdd = false
                    }) {
                        Text("Done")
                    }
                    .disabled(addDisabled)
                }
            }
            //Check For Title Text Field Being Blank And Disable Done Button If It Is
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
                Section(header: Label("Notifications", systemImage: "calendar")) {
                    //Button To Schedule App Notifications
                    Button(action: {
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                            if success {
                             print("Authorised")
                                self.showingNotificationAlert = true
                            } else if let error = error {
                                print(error.localizedDescription)
                            }
                        }
                        let content = UNMutableNotificationContent()
                        let content2 = UNMutableNotificationContent()
                        let content3 = UNMutableNotificationContent()
                        let content4 = UNMutableNotificationContent()
                        let content5 = UNMutableNotificationContent()
                        let content6 = UNMutableNotificationContent()
                        let content7 = UNMutableNotificationContent()
                        content.title = "Happening First Today"
                        content2.title = "Happening First Today"
                        content3.title = "Happening First Today"
                        content4.title = "Happening First Today"
                        content5.title = "Happening First Today"
                        content6.title = "Happening First Today"
                        content7.title = "Happening First Today"
                        content.body = "Monday - \(items.first?.title ?? "None")"
                        content2.body = "Tuesday - \(items2.first?.title ?? "None")"
                        content3.body = "Wednesday - \(items3.first?.title ?? "None")"
                        content4.body = "Thursday - \(items4.first?.title ?? "None")"
                        content5.body = "Friday - \(items5.first?.title ?? "None")"
                        content6.body = "Saturday - \(items6.first?.title ?? "None")"
                        content7.body = "Sunday - \(items7.first?.title ?? "None")"
                        content.sound = UNNotificationSound.default
                        content2.sound = UNNotificationSound.default
                        content3.sound = UNNotificationSound.default
                        content4.sound = UNNotificationSound.default
                        content5.sound = UNNotificationSound.default
                        content6.sound = UNNotificationSound.default
                        content7.sound = UNNotificationSound.default
                        var date = DateComponents()
                        date.hour = 9
                        date.minute = 0
                        date.weekday = 2
                        var date2 = DateComponents()
                        date2.hour = 9
                        date2.minute = 0
                        date2.weekday = 3
                        var date3 = DateComponents()
                        date3.hour = 9
                        date3.minute = 0
                        date3.weekday = 4
                        var date4 = DateComponents()
                        date4.hour = 9
                        date4.minute = 0
                        date4.weekday = 5
                        var date5 = DateComponents()
                        date5.hour = 9
                        date5.minute = 0
                        date5.weekday = 6
                        var date6 = DateComponents()
                        date6.hour = 9
                        date6.minute = 0
                        date6.weekday = 7
                        var date7 = DateComponents()
                        date7.hour = 9
                        date7.minute = 0
                        date7.weekday = 1
                        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
                        let trigger2 = UNCalendarNotificationTrigger(dateMatching: date2, repeats: true)
                        let trigger3 = UNCalendarNotificationTrigger(dateMatching: date3, repeats: true)
                        let trigger4 = UNCalendarNotificationTrigger(dateMatching: date4, repeats: true)
                        let trigger5 = UNCalendarNotificationTrigger(dateMatching: date5, repeats: true)
                        let trigger6 = UNCalendarNotificationTrigger(dateMatching: date6, repeats: true)
                        let trigger7 = UNCalendarNotificationTrigger(dateMatching: date7, repeats: true)
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        let request2 = UNNotificationRequest(identifier: UUID().uuidString, content: content2, trigger: trigger2)
                        let request3 = UNNotificationRequest(identifier: UUID().uuidString, content: content3, trigger: trigger3)
                        let request4 = UNNotificationRequest(identifier: UUID().uuidString, content: content4, trigger: trigger4)
                        let request5 = UNNotificationRequest(identifier: UUID().uuidString, content: content5, trigger: trigger5)
                        let request6 = UNNotificationRequest(identifier: UUID().uuidString, content: content6, trigger: trigger6)
                        let request7 = UNNotificationRequest(identifier: UUID().uuidString, content: content7, trigger: trigger7)
                        UNUserNotificationCenter.current().add(request)
                        UNUserNotificationCenter.current().add(request2)
                        UNUserNotificationCenter.current().add(request3)
                        UNUserNotificationCenter.current().add(request4)
                        UNUserNotificationCenter.current().add(request5)
                        UNUserNotificationCenter.current().add(request6)
                        UNUserNotificationCenter.current().add(request7)
                    }) {
                        Text("Schedule Notifications")
                    }
                    //Confirmation Alerts
                    .alert("Notifications Scheduled", isPresented: $showingNotificationAlert) {
                        Button(action: {self.showingNotificationAlert = false}) {
                            Text("Done")
                        }
                    }
                    .alert("Notifications Cleared", isPresented: $showingNotificationsClearedAlert) {
                        Button(action: {self.showingNotificationsClearedAlert = true}) {
                            Text("Done")
                        }
                    }
                    //Button To Clear The Scheduled Notifications
                    Button(action: {
                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                        self.showingNotificationsClearedAlert = true
                    }) {
                        Text("Clear Scheduled Notifications")
                    }
                }
                //Version Information
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

//Xcode Previews View
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
