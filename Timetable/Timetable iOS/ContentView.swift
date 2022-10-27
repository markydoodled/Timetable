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
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State var showingAdd = false
    @State var showingSettings = false
    @State var showingNotificationAlert = false
    @State var addDisabled = true
    @State var titleText = ""
    @State var locationText = ""
    @State var notesText = ""
    @State var selectedDay = 1
    @State var selectedTime = Date()
    @State var selectedTimeDetail = ""
    @State var day = 1
    @AppStorage("isDark") var isDark = false
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
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
    //Home Screen View
    var body: some View {
        if horizontalSizeClass == .compact {
            NavigationStack {
                Form {
                    Section(header: Label("Monday", systemImage: "1.circle")) {
                        ForEach(items) { item in
                            NavigationLink(destination: detail.onAppear() {
                                self.titleText = item.title ?? "Error"
                                self.locationText = item.location ?? "Error"
                                self.notesText = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                            }
                                .onDisappear() {
                                    self.titleText = ""
                                    self.locationText = ""
                                    self.notesText = ""
                                    self.selectedDay = 1
                                    self.selectedTime = Date()
                                }) {
                                VStack(alignment: .leading) {
                                    Text(item.title ?? "Error")
                                        .bold()
                                        .font(.system(.title, design: .rounded))
                                        .foregroundColor(.red)
                                    if item.location != "" {
                                        Text(item.location ?? "Error")
                                            .font(.system(.title2, design: .rounded))
                                    }
                                    Text(item.dueTime ?? "Error")
                                        .font(.system(.title3, design: .rounded))
                                        .foregroundColor(.secondary)
                                }
                            }
                            .contextMenu {
                                ShareLink(item: "\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")")
                            }
                            .onDrag {
                                return NSItemProvider(object: String("\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")") as NSString)
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
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                            }
                                .onDisappear() {
                                    self.titleText = ""
                                    self.locationText = ""
                                    self.notesText = ""
                                    self.selectedDay = 1
                                    self.selectedTime = Date()
                                }) {
                                VStack(alignment: .leading) {
                                    Text(item.title ?? "Error")
                                        .bold()
                                        .font(.system(.title, design: .rounded))
                                        .foregroundColor(.orange)
                                    if item.location != "" {
                                        Text(item.location ?? "Error")
                                            .font(.system(.title2, design: .rounded))
                                    }
                                    Text(item.dueTime ?? "Error")
                                        .font(.system(.title3, design: .rounded))
                                        .foregroundColor(.secondary)
                                }
                            }
                            .contextMenu {
                                ShareLink(item: "\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")")
                            }
                            .onDrag {
                                return NSItemProvider(object: String("\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")") as NSString)
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
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                            }
                                .onDisappear() {
                                    self.titleText = ""
                                    self.locationText = ""
                                    self.notesText = ""
                                    self.selectedDay = 1
                                    self.selectedTime = Date()
                                }) {
                                VStack(alignment: .leading) {
                                    Text(item.title ?? "Error")
                                        .bold()
                                        .font(.system(.title, design: .rounded))
                                        .foregroundColor(.yellow)
                                    if item.location != "" {
                                        Text(item.location ?? "Error")
                                            .font(.system(.title2, design: .rounded))
                                    }
                                    Text(item.dueTime ?? "Error")
                                        .font(.system(.title3, design: .rounded))
                                        .foregroundColor(.secondary)
                                }
                            }
                            .contextMenu {
                                ShareLink(item: "\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")")
                            }
                            .onDrag {
                                return NSItemProvider(object: String("\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")") as NSString)
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
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                            }
                                .onDisappear() {
                                    self.titleText = ""
                                    self.locationText = ""
                                    self.notesText = ""
                                    self.selectedDay = 1
                                    self.selectedTime = Date()
                                }) {
                                VStack(alignment: .leading) {
                                    Text(item.title ?? "Error")
                                        .bold()
                                        .font(.system(.title, design: .rounded))
                                        .foregroundColor(.green)
                                    if item.location != "" {
                                        Text(item.location ?? "Error")
                                            .font(.system(.title2, design: .rounded))
                                    }
                                    Text(item.dueTime ?? "Error")
                                        .font(.system(.title3, design: .rounded))
                                        .foregroundColor(.secondary)
                                }
                            }
                            .contextMenu {
                                ShareLink(item: "\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")")
                            }
                            .onDrag {
                                return NSItemProvider(object: String("\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")") as NSString)
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
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                            }
                                .onDisappear() {
                                    self.titleText = ""
                                    self.locationText = ""
                                    self.notesText = ""
                                    self.selectedDay = 1
                                    self.selectedTime = Date()
                                }) {
                                VStack(alignment: .leading) {
                                    Text(item.title ?? "Error")
                                        .bold()
                                        .font(.system(.title, design: .rounded))
                                        .foregroundColor(.blue)
                                    if item.location != "" {
                                        Text(item.location ?? "Error")
                                            .font(.system(.title2, design: .rounded))
                                    }
                                    Text(item.dueTime ?? "Error")
                                        .font(.system(.title3, design: .rounded))
                                        .foregroundColor(.secondary)
                                }
                            }
                            .contextMenu {
                                ShareLink(item: "\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")")
                            }
                            .onDrag {
                                return NSItemProvider(object: String("\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")") as NSString)
                            }
                        }
                        .onDelete { indexSet in
                                for index in indexSet {
                                    managedObjectContext.delete(items5[index])
                                }
                                PersistenceController.shared.save()
                            }
                    }
                }
                .navigationTitle("Timetable")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {self.showingSettings = true}) {
                            Image(systemName: "gearshape")
                        }
                        .keyboardShortcut(KeyboardShortcut(",", modifiers: .command))
                        .sheet(isPresented: $showingSettings) {
                            settings
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {self.showingAdd = true}) {
                            Image(systemName: "plus")
                        }
                        .keyboardShortcut(KeyboardShortcut("n", modifiers: [.command, .shift]))
                        .sheet(isPresented: $showingAdd) {
                            add
                                .presentationDetents([.medium, .large])
                        }
                    }
                }
                .toolbarRole(.navigationStack)
                .preferredColorScheme(isDark ? .dark : .light)
            }
        } else {
            NavigationSplitView {
                Form {
                    Section(header: Label("Monday", systemImage: "1.circle")) {
                        ForEach(items) { item in
                            NavigationLink(destination: detail.onAppear() {
                                self.titleText = item.title ?? "Error"
                                self.locationText = item.location ?? "Error"
                                self.notesText = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                            }) {
                                VStack(alignment: .leading) {
                                    Text(item.title ?? "Error")
                                        .bold()
                                        .font(.system(.title, design: .rounded))
                                        .foregroundColor(.red)
                                    if item.location != "" {
                                        Text(item.location ?? "Error")
                                            .font(.system(.title2, design: .rounded))
                                    }
                                    Text(item.dueTime ?? "Error")
                                        .font(.system(.title3, design: .rounded))
                                        .foregroundColor(.secondary)
                                }
                            }
                            .contextMenu {
                                ShareLink(item: "\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")")
                            }
                            .onDrag {
                                return NSItemProvider(object: String("\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")") as NSString)
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
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                            }) {
                                VStack(alignment: .leading) {
                                    Text(item.title ?? "Error")
                                        .bold()
                                        .font(.system(.title, design: .rounded))
                                        .foregroundColor(.orange)
                                    if item.location != "" {
                                        Text(item.location ?? "Error")
                                            .font(.system(.title2, design: .rounded))
                                    }
                                    Text(item.dueTime ?? "Error")
                                        .font(.system(.title3, design: .rounded))
                                        .foregroundColor(.secondary)
                                }
                            }
                            .contextMenu {
                                ShareLink(item: "\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")")
                            }
                            .onDrag {
                                return NSItemProvider(object: String("\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")") as NSString)
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
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                            }) {
                                VStack(alignment: .leading) {
                                    Text(item.title ?? "Error")
                                        .bold()
                                        .font(.system(.title, design: .rounded))
                                        .foregroundColor(.yellow)
                                    if item.location != "" {
                                        Text(item.location ?? "Error")
                                            .font(.system(.title2, design: .rounded))
                                    }
                                    Text(item.dueTime ?? "Error")
                                        .font(.system(.title3, design: .rounded))
                                        .foregroundColor(.secondary)
                                }
                            }
                            .contextMenu {
                                ShareLink(item: "\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")")
                            }
                            .onDrag {
                                return NSItemProvider(object: String("\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")") as NSString)
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
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                            }) {
                                VStack(alignment: .leading) {
                                    Text(item.title ?? "Error")
                                        .bold()
                                        .font(.system(.title, design: .rounded))
                                        .foregroundColor(.green)
                                    if item.location != "" {
                                        Text(item.location ?? "Error")
                                            .font(.system(.title2, design: .rounded))
                                    }
                                    Text(item.dueTime ?? "Error")
                                        .font(.system(.title3, design: .rounded))
                                        .foregroundColor(.secondary)
                                }
                            }
                            .contextMenu {
                                ShareLink(item: "\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")")
                            }
                            .onDrag {
                                return NSItemProvider(object: String("\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")") as NSString)
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
                                self.selectedTimeDetail = item.dueTime ?? "Error"
                            }) {
                                VStack(alignment: .leading) {
                                    Text(item.title ?? "Error")
                                        .bold()
                                        .font(.system(.title, design: .rounded))
                                        .foregroundColor(.blue)
                                    if item.location != "" {
                                        Text(item.location ?? "Error")
                                            .font(.system(.title2, design: .rounded))
                                    }
                                    Text(item.dueTime ?? "Error")
                                        .font(.system(.title3, design: .rounded))
                                        .foregroundColor(.secondary)
                                }
                            }
                            .contextMenu {
                                ShareLink(item: "\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")")
                            }
                            .onDrag {
                                return NSItemProvider(object: String("\(item.title ?? "Error")\n\(item.dueTime ?? "Error")\n\(item.location ?? "Error")") as NSString)
                            }
                        }
                        .onDelete { indexSet in
                                for index in indexSet {
                                    managedObjectContext.delete(items5[index])
                                }
                                PersistenceController.shared.save()
                            }
                    }
                }
                    .navigationTitle("Timetable")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {self.showingSettings = true}) {
                                Image(systemName: "gearshape")
                            }
                            .keyboardShortcut(KeyboardShortcut(",", modifiers: .command))
                            .sheet(isPresented: $showingSettings) {
                                settings
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {self.showingAdd = true}) {
                                Image(systemName: "plus")
                            }
                            .sheet(isPresented: $showingAdd) {
                                add
                            }
                            .keyboardShortcut(KeyboardShortcut("n", modifiers: [.command, .shift]))
                        }
                    }
                    .toolbarRole(.navigationStack)
                    .preferredColorScheme(isDark ? .dark : .light)
            } detail: {
                Image("AppsIcon")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(25)
            }
        }
    }
    //Detail View
    var detail: some View {
        Form {
            Section(header: Label("Title", systemImage: "textformat")) {
                Text("\(titleText)")
                    .textSelection(.enabled)
            }
            Section(header: Label("Location", systemImage: "location.fill")) {
                Text("\(locationText)")
                    .textSelection(.enabled)
            }
            Section(header: Label("Day", systemImage: "calendar")) {
                if selectedDay == 1 {
                    Text("Monday")
                        .textSelection(.enabled)
                } else if selectedDay == 2 {
                    Text("Tuesday")
                        .textSelection(.enabled)
                } else if selectedDay == 3 {
                    Text("Wednesday")
                        .textSelection(.enabled)
                } else if selectedDay == 4 {
                    Text("Thursday")
                        .textSelection(.enabled)
                } else if selectedDay == 5 {
                    Text("Friday")
                        .textSelection(.enabled)
                } else {
                    Text("Day Error")
                        .textSelection(.enabled)
                }
            }
            Section(header: Label("Time", systemImage: "calendar.badge.clock")) {
                Text("\(selectedTimeDetail)")
                    .textSelection(.enabled)
            }
            Section(header: Label("Notes", systemImage: "note.text")) {
                Text("\(notesText)")
                    .textSelection(.enabled)
            }
        }
            .navigationTitle("\(titleText)")
            .navigationBarTitleDisplayMode(.inline)
    }
    //Add Event View
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
                    DatePicker("Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.graphical)
                }
                Section {
                    TextField("Notes", text: $notesText, axis: .vertical)
                        .lineLimit(5)
                }
            }
            .navigationTitle("Add")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.titleText = ""
                        self.locationText = ""
                        self.notesText = ""
                        self.selectedDay = 1
                        self.selectedTime = Date()
                        self.showingAdd = false}) {
                        Text("Cancel")
                    }
                }
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
                        } else {
                            print("Error Day Range")
                        }
                        self.titleText = ""
                        self.locationText = ""
                        self.notesText = ""
                        self.selectedDay = 1
                        self.selectedTime = Date()
                        self.showingAdd = false}) {
                        Text("Done")
                    }
                        .disabled(addDisabled)
                }
            }
            .toolbarRole(.navigationStack)
        }
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
    //Settings View
    var settings: some View {
        NavigationStack {
            Form {
                Section(header: Label("Appearance", systemImage: "paintbrush.pointed")) {
                    Toggle("Use Dark Mode", isOn: $isDark)
                        .toggleStyle(.switch)
                }
                Section(header: Label("Permissions", systemImage: "lock")) {
                    Button(action: {UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
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
                        } else {
                            day = 6
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
                    Button(action: {UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)}) {
                        Text("Open Settings")
                    }
                }
                Section(header: Label("Misc.", systemImage: "ellipsis.circle")) {
                    LabeledContent("Version") {
                        Text("1.0")
                    }
                    LabeledContent("Build") {
                        Text("1")
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {self.showingSettings = false}) {
                        Text("Done")
                    }
                }
            }
            .toolbarRole(.navigationStack)
        }
    }
}

//Mail Feedback View
struct MailView: UIViewControllerRepresentable {
    @Binding var isShowing: Bool
    @Binding var result: Result<MFMailComposeResult, Error>?
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var isShowing: Bool
        @Binding var result: Result<MFMailComposeResult, Error>?
        init(isShowing: Binding<Bool>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _isShowing = isShowing
            _result = result
        }
        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                isShowing = false
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing,
                           result: $result)
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients(["30258571@bsdc.ac.uk"])
        vc.setSubject("Timetable App Feedback")
        vc.setMessageBody("Rating: \nBugs: \nFeature Request: \nOther Notes: ", isHTML: false)
        return vc
    }
    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

