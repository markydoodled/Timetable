//
//  SettingsView.swift
//  Timetable
//
//  Created by Mark Howard on 27/10/2022.
//

import SwiftUI
import UserNotifications

struct SettingsView: View {
    @State var day = 1
    @State var showingNotificationAlert = false
    @State var selectedDay = 1
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
        Form {
            GroupBox(label: Label("Notifications", systemImage: "calendar")) {
                HStack {
                    Spacer()
                VStack {
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
                        UNUserNotificationCenter.current().add(request)}) {
                            Text("Schedule Notifications")
                        }
                        .padding()
                        .alert("Notifications Scheduled", isPresented: $showingNotificationAlert) {
                            Button(action: {self.showingNotificationAlert = false}) {
                                Text("Done")
                            }
                        }
                    Button(action: {UNUserNotificationCenter.current().removeAllPendingNotificationRequests()}) {
                        Text("Clear Scheduled Notifications")
                    }
                    .padding()
                }
                    Spacer()
            }
            }
            .padding([.horizontal, .bottom])
        GroupBox(label: Label("Misc.", systemImage: "ellipsis.circle")) {
            VStack {
                HStack {
                   Text("Version")
                        .bold()
                    Spacer()
                    Text("1.1")
                }
                Divider()
                HStack {
                    Text("Build")
                        .bold()
                    Spacer()
                    Text("6")
                }
            }
            .padding()
                Button(action: {SendEmail.send()}) {
                    Text("Send Feedback")
                }
                .padding(.bottom)
        }
        .padding([.horizontal, .bottom])
    }
        .padding()
        .frame(width: 325, height: 400)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

class SendEmail: NSObject {
    static func send() {
        let service = NSSharingService(named: NSSharingService.Name.composeEmail)!
        service.recipients = ["markhoward2005@gmail.com"]
        service.subject = "Timetable Feedback"

        service.perform(withItems: ["Rating:", "Bugs:", "Feature Request:", "Other Notes:"])
    }
}
