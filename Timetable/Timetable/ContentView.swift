//
//  ContentView.swift
//  Timetable
//
//  Created by Mark Howard on 26/10/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var showingShare = false
    @State var showingAdd = false
    @State var showingNotificationAlert = false
    @State var addDisabled = true
    @State var titleText = ""
    @State var locationText = ""
    @State var notesText = ""
    @State var selectedDay = 1
    @State var selectedTime = Date()
    @State var selectedTimeDetail = ""
    @State var day = 1
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
    var body: some View {
        NavigationView {
            List {
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
            .listStyle(InsetListStyle())
            Image("AppsIcon")
                .resizable()
                .cornerRadius(25)
                .frame(width: 150, height: 150)
                .navigationTitle("Timetable")
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button(action: {NSApp.sendAction(#selector(NSSplitViewController.toggleSidebar(_:)), to: nil, from: nil)}) {
                            Image(systemName: "sidebar.left")
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button(action: {self.showingAdd = true}) {
                            Image(systemName: "plus")
                        }
                        .keyboardShortcut("n", modifiers: [.command, .shift])
                        .sheet(isPresented: $showingAdd) {
                            add
                                .frame(width: 500, height: 250)
                                .padding()
                        }
                    }
                }
        }
    }
    var add: some View {
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
                    .datePickerStyle(.compact)
            }
            Section {
                TextField("Notes", text: $notesText)
                    .lineLimit(5)
            }
            HStack {
                Spacer()
                Button(action: {
                    self.titleText = ""
                    self.locationText = ""
                    self.notesText = ""
                    self.selectedDay = 1
                    self.selectedTime = Date()
                    self.showingAdd = false}) {
                        Text("Cancel")
                    }
                    .buttonStyle(.bordered)
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
                    self.showingAdd = false
                }) {
                    Text("Done")
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
        }
    }
    var detail: some View {
        Form {
            GroupBox(label: Label("Title", systemImage: "textformat")) {
                HStack {
                    Spacer()
                Text("\(titleText)")
                    .textSelection(.enabled)
                    Spacer()
            }
            }
            .padding(.horizontal)
            GroupBox(label: Label("Location", systemImage: "location.fill")) {
                HStack {
                    Spacer()
                Text("\(locationText)")
                    .textSelection(.enabled)
                    Spacer()
            }
            }
            .padding(.horizontal)
            GroupBox(label: Label("Day", systemImage: "calendar")) {
                HStack {
                    Spacer()
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
                    Spacer()
            }
            }
            .padding(.horizontal)
            GroupBox(label: Label("Time", systemImage: "calendar.badge.clock")) {
                HStack {
                    Spacer()
                Text("\(selectedTimeDetail)")
                    .textSelection(.enabled)
                    Spacer()
            }
            }
            .padding(.horizontal)
            GroupBox(label: Label("Notes", systemImage: "note.text")) {
                HStack {
                    Spacer()
                Text("\(notesText)")
                    .textSelection(.enabled)
                    Spacer()
            }
            }
            .padding(.horizontal)
        }
        .navigationTitle("\(titleText)")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: {NSApp.sendAction(#selector(NSSplitViewController.toggleSidebar(_:)), to: nil, from: nil)}) {
                    Image(systemName: "sidebar.left")
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {self.showingShare = true}) {
                    Image(systemName: "square.and.arrow.up")
                }
                .background(SharingsPicker(isPresented: $showingShare, sharingItems: ["\(titleText)\n\(selectedTimeDetail)\n\(locationText)"]))
            }
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {self.showingAdd = true}) {
                    Image(systemName: "plus")
                }
                .keyboardShortcut("n", modifiers: [.command, .shift])
                .sheet(isPresented: $showingAdd) {
                    add
                        .frame(width: 500, height: 250)
                        .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SharingsPicker: NSViewRepresentable {
    @Binding var isPresented: Bool
    var sharingItems: [Any] = []

    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        if isPresented {
            let picker = NSSharingServicePicker(items: sharingItems)
            picker.delegate = context.coordinator

            DispatchQueue.main.async {
                picker.show(relativeTo: .zero, of: nsView, preferredEdge: .minY)
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(owner: self)
    }

    class Coordinator: NSObject, NSSharingServicePickerDelegate {
        let owner: SharingsPicker

        init(owner: SharingsPicker) {
            self.owner = owner
        }

        func sharingServicePicker(_ sharingServicePicker: NSSharingServicePicker, didChoose service: NSSharingService?) {
            sharingServicePicker.delegate = nil
            self.owner.isPresented = false
        }
    }
}
