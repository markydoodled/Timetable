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
    @State var titleTextDetail = ""
    @State var locationText = ""
    @State var locationTextDetail = ""
    @State var notesText = ""
    @State var notesTextDetail = ""
    @State var selectedDay = 1
    @State var selectedDayDetail = ""
    @State var selectedTime = Date()
    @State var selectedTimeDetail = ""
    @State var day = 1
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
    @FetchRequest(entity: Saturday.entity(),
                  sortDescriptors: [],
            animation: .default)
    private var items6: FetchedResults<Saturday>
    @FetchRequest(entity: Sunday.entity(),
                  sortDescriptors: [],
            animation: .default)
    private var items7: FetchedResults<Sunday>
    //Home Screen View
    var body: some View {
        if horizontalSizeClass == .compact {
            NavigationStack {
                List {
                    Section(header: Label("Monday", systemImage: "1.circle")) {
                        ForEach(items) { item in
                            NavigationLink(destination: detail.onAppear() {
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
                            .onDrag {
                                return NSItemProvider(object: String("\(titleTextDetail)\n\(selectedTimeDetail)\n\(locationTextDetail))") as NSString)
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
                            .onDrag {
                                return NSItemProvider(object: String("\(titleTextDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)") as NSString)
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
                            .onDrag {
                                return NSItemProvider(object: String("\(titleTextDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)") as NSString)
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
                            .onDrag {
                                return NSItemProvider(object: String("\(titleTextDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)") as NSString)
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
                            .onDrag {
                                return NSItemProvider(object: String("\(titleTextDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)") as NSString)
                            }
                        }
                        .onDelete { indexSet in
                                for index in indexSet {
                                    managedObjectContext.delete(items5[index])
                                }
                                PersistenceController.shared.save()
                            }
                    }
                    Section(header: Label("Saturday", systemImage: "6.circle")) {
                        ForEach(items6) { item in
                            NavigationLink(destination: detail.onAppear() {
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
                            .onDrag {
                                return NSItemProvider(object: String("\(titleTextDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)") as NSString)
                            }
                        }
                        .onDelete { indexSet in
                                for index in indexSet {
                                    managedObjectContext.delete(items6[index])
                                }
                                PersistenceController.shared.save()
                            }
                    }
                    Section(header: Label("Sunday", systemImage: "7.circle")) {
                        ForEach(items7) { item in
                            NavigationLink(destination: detail.onAppear() {
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
                            .onDrag {
                                return NSItemProvider(object: String("\(titleTextDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)") as NSString)
                            }
                        }
                        .onDelete { indexSet in
                                for index in indexSet {
                                    managedObjectContext.delete(items7[index])
                                }
                                PersistenceController.shared.save()
                            }
                    }
                }
                .listStyle(.sidebar)
                .navigationTitle("Timetable")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {self.showingSettings = true}) {
                            Image(systemName: "gearshape")
                        }
                        .keyboardShortcut(",")
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
                        .keyboardShortcut("n", modifiers: [.command, .shift])
                        .sheet(isPresented: $showingAdd) {
                            add
                                .presentationDetents([.medium, .large])
                                .presentationDragIndicator(.visible)
                        }
                    }
                }
            }
        } else {
            NavigationSplitView {
                List {
                    Section(header: Label("Monday", systemImage: "1.circle")) {
                        ForEach(items) { item in
                            NavigationLink(destination: detail.onAppear() {
                                self.titleTextDetail = item.title ?? "Error"
                                self.locationTextDetail = item.location ?? "Error"
                                self.notesTextDetail = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
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
                            .onDrag {
                                return NSItemProvider(object: String("\(titleTextDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)") as NSString)
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
                                self.titleTextDetail = item.title ?? "Error"
                                self.locationTextDetail = item.location ?? "Error"
                                self.notesTextDetail = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
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
                            .onDrag {
                                return NSItemProvider(object: String("\(titleTextDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)") as NSString)
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
                                self.titleTextDetail = item.title ?? "Error"
                                self.locationTextDetail = item.location ?? "Error"
                                self.notesTextDetail = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
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
                            .onDrag {
                                return NSItemProvider(object: String("\(titleTextDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)") as NSString)
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
                                self.titleTextDetail = item.title ?? "Error"
                                self.locationTextDetail = item.location ?? "Error"
                                self.notesTextDetail = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
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
                            .onDrag {
                                return NSItemProvider(object: String("\(titleTextDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)") as NSString)
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
                                self.titleTextDetail = item.title ?? "Error"
                                self.locationTextDetail = item.location ?? "Error"
                                self.notesTextDetail = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
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
                            .onDrag {
                                return NSItemProvider(object: String("\(titleTextDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)") as NSString)
                            }
                        }
                        .onDelete { indexSet in
                                for index in indexSet {
                                    managedObjectContext.delete(items5[index])
                                }
                                PersistenceController.shared.save()
                            }
                    }
                    Section(header: Label("Saturday", systemImage: "6.circle")) {
                        ForEach(items6) { item in
                            NavigationLink(destination: detail.onAppear() {
                                self.titleTextDetail = item.title ?? "Error"
                                self.locationTextDetail = item.location ?? "Error"
                                self.notesTextDetail = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
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
                            .onDrag {
                                return NSItemProvider(object: String("\(titleTextDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)") as NSString)
                            }
                        }
                        .onDelete { indexSet in
                                for index in indexSet {
                                    managedObjectContext.delete(items6[index])
                                }
                                PersistenceController.shared.save()
                            }
                    }
                    Section(header: Label("Sunday", systemImage: "7.circle")) {
                        ForEach(items7) { item in
                            NavigationLink(destination: detail.onAppear() {
                                self.titleTextDetail = item.title ?? "Error"
                                self.locationTextDetail = item.location ?? "Error"
                                self.notesTextDetail = item.notes ?? "Error"
                                self.selectedDay = Int(item.day)
                                self.selectedTimeDetail = item.dueTime ?? "Error"
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
                            .onDrag {
                                return NSItemProvider(object: String("\(titleTextDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)") as NSString)
                            }
                        }
                        .onDelete { indexSet in
                                for index in indexSet {
                                    managedObjectContext.delete(items7[index])
                                }
                                PersistenceController.shared.save()
                            }
                    }
                }
                .listStyle(.sidebar)
                    .navigationTitle("Timetable")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {self.showingSettings = true}) {
                                Image(systemName: "gearshape")
                            }
                            .keyboardShortcut(",")
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
                            .keyboardShortcut("n", modifiers: [.command, .shift])
                        }
                    }
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
                Text("\(titleTextDetail)")
                    .textSelection(.enabled)
                    .font(.title)
            }
            if locationTextDetail != "" {
                Section(header: Label("Location", systemImage: "location.fill")) {
                    Text("\(locationTextDetail)")
                        .textSelection(.enabled)
                        .font(.title)
                }
            }
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
            Section(header: Label("Time", systemImage: "calendar.badge.clock")) {
                Text("\(selectedTimeDetail)")
                    .textSelection(.enabled)
                    .font(.title)
            }
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    ShareLink(item: "\(titleTextDetail)\n\(selectedDayDetail)\n\(selectedTimeDetail)\n\(locationTextDetail)\n\(notesTextDetail)")
                }
            }
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
                        Text("Saturday")
                            .tag(6)
                        Text("Sunday")
                            .tag(7)
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
                        self.showingAdd = false}) {
                        Text("Done")
                    }
                        .disabled(addDisabled)
                }
            }
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
                Section(header: Label("Notifications", systemImage: "calendar")) {
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
                        } else if dateOut == "Saturday" {
                            day = 6
                        } else if dateOut == "Sunday" {
                            day = 7
                        } else {
                            day = 8
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
                        } else if selectedDay == 6 {
                            content.subtitle = "Saturday - \(items6.first?.title ?? "None")"
                        } else if selectedDay == 7 {
                            content.subtitle = "Sunday - \(items7.first?.title ?? "None")"
                        } else {
                            content.subtitle = "Unrecognised Day"
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
                    .alert("Notifications Scheduled", isPresented: $showingNotificationAlert) {
                        Button(action: {self.showingNotificationAlert = false}) {
                            Text("Done")
                        }
                    }
                    Button(action: {UNUserNotificationCenter.current().removeAllPendingNotificationRequests()}) {
                        Text("Clear Scheduled Notifications")
                    }
                    Button(action: {UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)}) {
                        Text("Open Settings")
                    }
                }
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {self.showingSettings = false}) {
                        Text("Done")
                    }
                }
            }
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
        vc.setToRecipients(["markhoward2005@gmail.com"])
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

