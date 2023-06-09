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
    @State var day = 1
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
                        let dateF = Date()
                        let formatter = DateFormatter()
                        formatter.dateStyle = .full
                        formatter.dateFormat = "EEEE"
                        let dateOut = formatter.string(from: dateF)
                        if dateOut == "Monday" {
                            day = 1
                        } else if dateOut == "Tuesday" {
                            day = 2
                        } else if dateOut == "Wednesday" {
                            day = 3
                        } else if dateOut == "Thursday" {
                            day = 4
                        } else if dateOut == "Friday" {
                            day = 5
                        } else if dateOut == "Saturday" {
                            day = 6
                        } else if dateOut == "Sunday" {
                            day = 7
                        } else {
                            day = 8
                        }
                        let content = UNMutableNotificationContent()
                        content.title = "Happening First Today"
                        if day == 1 {
                            content.body = "Monday - \(items.first?.title ?? "None")"
                        } else if day == 2 {
                            content.body = "Tuesday - \(items2.first?.title ?? "None")"
                        } else if day == 3 {
                            content.body = "Wednesday - \(items3.first?.title ?? "None")"
                        } else if day == 4 {
                            content.body = "Thursday - \(items4.first?.title ?? "None")"
                        } else if day == 5 {
                            content.body = "Friday - \(items5.first?.title ?? "None")"
                        } else if day == 6 {
                            content.body = "Saturday - \(items6.first?.title ?? "None")"
                        } else if day == 7 {
                            content.body = "Sunday - \(items7.first?.title ?? "None")"
                        } else {
                            content.body = "Not A Weekday Today"
                        }
                        content.sound = UNNotificationSound.default
                        var date = DateComponents()
                        date.hour = 9
                        date.minute = 0
                        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        UNUserNotificationCenter.current().add(request)
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
