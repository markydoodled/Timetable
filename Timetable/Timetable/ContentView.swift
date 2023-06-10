//
//  ContentView.swift
//  Timetable iOS
//
//  Created by Mark Howard on 26/10/2022.
//

import SwiftUI
import UserNotifications
import CoreData
import MessageUI

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
    @State var showingAdd = false
    @State var showingSettings = false
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
    //Mail View Variables
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    //Main View
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
                                    .font(.title)
                                    .foregroundColor(.red)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.title2)
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
                                    .font(.title)
                                    .foregroundColor(.orange)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.title2)
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
                                    .font(.title)
                                    .foregroundColor(.yellow)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.title2)
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
                                    .font(.title)
                                    .foregroundColor(.green)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.title2)
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
                                    .font(.title)
                                    .foregroundColor(.cyan)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.title2)
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
                                    .font(.title)
                                    .foregroundColor(.pink)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.title2)
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
                                    .font(.title)
                                    .foregroundColor(.purple)
                                if item.location != "" {
                                    Text(item.location ?? "Error")
                                        .font(.title2)
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
            }
            .listStyle(.sidebar)
            #if !targetEnvironment(macCatalyst)
            .navigationTitle("Timetable")
            #endif
            .toolbar {
                //Button And Shortcut To Show The Settings View
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {self.showingSettings = true}) {
                        Image(systemName: "gearshape")
                    }
                    .keyboardShortcut(",")
                    .sheet(isPresented: $showingSettings) {
                        settings
                    }
                }
                //Drop The Task List Into Edit Mode
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                //Button And Shortcut To Show The Add View
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {self.showingAdd = true}) {
                        Image(systemName: "plus")
                    }
                    .keyboardShortcut("n", modifiers: [.command, .shift])
                    .sheet(isPresented: $showingAdd) {
                        add
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.visible)
                    }
                }
            }
        }
    }
    //Task Detail View
    var detail: some View {
        Form {
            //Display Title
            Section(header: Label("Title", systemImage: "textformat")) {
                Text("\(titleTextDetail)")
                    .textSelection(.enabled)
                    .font(.title)
            }
            //Display The Location
            if locationTextDetail != "" {
                Section(header: Label("Location", systemImage: "location.fill")) {
                    Text("\(locationTextDetail)")
                        .textSelection(.enabled)
                        .font(.title)
                }
            }
            //Display The Day
            Section(header: Label("Day", systemImage: "calendar")) {
                if selectedDay == 1 {
                    Text("Monday")
                        .textSelection(.enabled)
                        .font(.title)
                } else if selectedDay == 2 {
                    Text("Tuesday")
                        .textSelection(.enabled)
                        .font(.title)
                } else if selectedDay == 3 {
                    Text("Wednesday")
                        .textSelection(.enabled)
                        .font(.title)
                } else if selectedDay == 4 {
                    Text("Thursday")
                        .textSelection(.enabled)
                        .font(.title)
                } else if selectedDay == 5 {
                    Text("Friday")
                        .textSelection(.enabled)
                        .font(.title)
                } else if selectedDay == 6 {
                    Text("Saturday")
                        .textSelection(.enabled)
                        .font(.title)
                } else if selectedDay == 7 {
                    Text("Sunday")
                        .textSelection(.enabled)
                        .font(.title)
                } else {
                    Text("Day Error")
                        .textSelection(.enabled)
                        .font(.title)
                }
            }
            //Display The Time
            Section(header: Label("Time", systemImage: "calendar.badge.clock")) {
                Text("\(selectedTimeDetail)")
                    .textSelection(.enabled)
                    .font(.title)
            }
            //Display The Notes
            if notesTextDetail != "" {
                Section(header: Label("Notes", systemImage: "note.text")) {
                    Text("\(notesTextDetail)")
                        .textSelection(.enabled)
                        .font(.title)
                }
            }
        }
        .navigationTitle("\(titleTextDetail)")
        .toolbar {
            //Share The Task Through The Share Sheet
            ToolbarItem(placement: .navigationBarTrailing) {
                ShareLink(item: "\(titleTextDetail)\n\(selectedDayDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)\n\(notesTextDetail)")
            }
        }
    }
    //Add Sheet View
    var add: some View {
        NavigationStack {
            Form {
                Section {
                    //Text Fields For Title And Location
                    TextField("Title", text: $titleText)
                    TextField("Location", text: $locationText)
                }
                //Select A Day
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
                    //Select A Time
                    DatePicker("Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.graphical)
                }
                //Notes Field
                Section {
                    TextField("Notes", text: $notesText, axis: .vertical)
                        .lineLimit(5)
                }
            }
            .navigationTitle("Add")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                //Cancel The Add, Close The View And Reset The Variables
                ToolbarItem(placement: .navigationBarLeading) {
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
                //Complete The Add, Dismiss The View And Write The Variable To The Database
                ToolbarItem(placement: .navigationBarTrailing) {
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
        }
        //Monitor If Title Is Not Empty To Enable The Add Button
        .onChange(of: titleText) { newValue in
            if titleText != "" {
                addDisabled = false
            } else {
                addDisabled = true
            }
        }
        .onAppear() {
            if titleText == "" {
                addDisabled = true
            }
        }
    }
    //Settings Page View
    var settings: some View {
        NavigationStack {
            Form {
                Section(header: Label("Notifications", systemImage: "calendar")) {
                    //Register Notifications
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
                        date.day = 1
                        var date2 = DateComponents()
                        date2.hour = 9
                        date2.minute = 0
                        date2.day = 2
                        var date3 = DateComponents()
                        date3.hour = 9
                        date3.minute = 0
                        date3.day = 3
                        var date4 = DateComponents()
                        date4.hour = 9
                        date4.minute = 0
                        date4.day = 4
                        var date5 = DateComponents()
                        date5.hour = 9
                        date5.minute = 0
                        date5.day = 5
                        var date6 = DateComponents()
                        date6.hour = 9
                        date6.minute = 0
                        date6.day = 6
                        var date7 = DateComponents()
                        date7.hour = 9
                        date7.minute = 0
                        date7.day = 7
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
                    //Show Confirmation Alerts
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
                    //Clear Notifications
                    Button(action: {
                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                        self.showingNotificationsClearedAlert = true
                    }) {
                        Text("Clear Scheduled Notifications")
                    }
                    //Open iOS Settings App
                    #if !targetEnvironment(macCatalyst)
                    Button(action: {UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)}) {
                        Text("Open Settings")
                    }
                    #endif
                }
                //Version Information And Feedback Button
                Section(header: Label("Misc.", systemImage: "ellipsis.circle")) {
                    LabeledContent("Version") {
                        Text("1.1")
                    }
                    LabeledContent("Build") {
                        Text("6")
                    }
                    Button(action: {self.isShowingMailView.toggle()}) {
                        Text("Send Feedback")
                    }
                    .sheet(isPresented: $isShowingMailView) {
                        MailView(isShowing: self.$isShowingMailView, result: self.$result)
                    }
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                //Dismiss The View
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {self.showingSettings = false}) {
                        Text("Done")
                    }
                }
            }
        }
    }
}

//Define A Struct Called MailView That Conforms To The UIViewControllerRepresentable Protocol
struct MailView: UIViewControllerRepresentable {
    //Define Two Bindings That Will Be Used To Control The Presentation Of The Mail Compose View Controller
    @Binding var isShowing: Bool
    @Binding var result: Result<MFMailComposeResult, Error>?
    
    //Define A Coordinator Class That Will Be Used To Handle The Delegate Methods Of The Mail Compose View Controller
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        //Define Two Bindings That Will Be Used To Control The Presentation Of The Mail Compose View Controller
        @Binding var isShowing: Bool
        @Binding var result: Result<MFMailComposeResult, Error>?

        //Initialize The Coordinator With The Two Bindings
        init(isShowing: Binding<Bool>, result: Binding<Result<MFMailComposeResult, Error>?>) {
            _isShowing = isShowing
            _result = result
        }

        //Implement The didFinishWith Delegate Method To Handle The Result Of The Mail Compose View Controller
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            //Dismiss The Mail Compose View Controller
            defer {
                isShowing = false
            }
            //If There Was An Error, Set The Result Binding To A Failure With The Error
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            //Otherwise, Set The Result Binding To A Success With The Result
            self.result = .success(result)
        }
    }

    //Implement The makeCoordinator Method To Create A New Coordinator Instance
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing, result: $result)
    }

    //Implement The makeUIViewController Method To Create A New MFMailComposeViewController Instance
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients(["markhoward2005@gmail.com"])
        vc.setSubject("Timetable App Feedback")
        vc.setMessageBody("Rating: \nBugs: \nFeature Request: \nOther Notes: ", isHTML: false)
        return vc
    }

    //Implement The updateUIViewController Method To Do Nothing
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<MailView>) {
        
    }
}

//Xcode Previews View
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

