//
//  Timetable_Widget_iOS.swift
//  Timetable Widget iOS
//
//  Created by Mark Howard on 26/10/2022.
//

import WidgetKit
import SwiftUI

//Create A Timeline For Updating The Widget
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 6 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

//Create An Entry For The Timeline
struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct Timetable_Widget_iOSEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family: WidgetFamily
    @State var day = 1
    var body: some View {
        switch family {
        //Home Screen Small Widget
        case .systemSmall:
            ZStack {
                if day == 1 {
                    Rectangle()
                        .foregroundColor(.red)
                    VStack {
                        Text("Today Is")
                            .bold()
                            .foregroundColor(.white)
                        Text("Monday")
                            .bold()
                            .foregroundColor(.white)
                    }
                } else if day == 2 {
                    Rectangle()
                        .foregroundColor(.orange)
                    VStack {
                        Text("Today Is")
                            .bold()
                            .foregroundColor(.white)
                        Text("Tuesday")
                            .bold()
                            .foregroundColor(.white)
                    }
                } else if day == 3 {
                    Rectangle()
                        .foregroundColor(.yellow)
                    VStack {
                        Text("Today Is")
                            .bold()
                            .foregroundColor(.white)
                        Text("Wednesday")
                            .bold()
                            .foregroundColor(.white)
                    }
                } else if day == 4 {
                    Rectangle()
                        .foregroundColor(.green)
                    VStack {
                        Text("Today Is")
                            .bold()
                            .foregroundColor(.white)
                        Text("Thursday")
                            .bold()
                            .foregroundColor(.white)
                    }
                } else if day == 5 {
                    Rectangle()
                        .foregroundColor(.cyan)
                    VStack {
                        Text("Today Is")
                            .bold()
                            .foregroundColor(.white)
                        Text("Friday")
                            .bold()
                            .foregroundColor(.white)
                    }
                } else if day == 6 {
                    Rectangle()
                        .foregroundColor(.pink)
                    VStack {
                        Text("Today Is")
                            .bold()
                            .foregroundColor(.white)
                        Text("Saturday")
                            .bold()
                            .foregroundColor(.white)
                    }
                } else if day == 7 {
                    Rectangle()
                        .foregroundColor(.purple)
                    VStack {
                        Text("Today Is")
                            .bold()
                            .foregroundColor(.white)
                        Text("Sunday")
                            .bold()
                            .foregroundColor(.white)
                    }
                } else {
                    Rectangle()
                        .foregroundColor(.gray)
                    Text("Error Day Select")
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .onAppear() {
                let date = Date()
                let formatter = DateFormatter()
                formatter.dateStyle = .full
                formatter.dateFormat = "EEEE"
                let dateOut = formatter.string(from: date)
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
            }
        case .accessoryInline:
            Text("Unused")
        //Lock Screen Rectange Widget
        case .accessoryRectangular:
            HStack {
                VStack(alignment: .leading) {
                    if day == 1 {
                        Label("Timetable", systemImage: "1.circle")
                            .bold()
                        Text("Today Is")
                        Text("Monday")
                    } else if day == 2 {
                        Label("Timetable", systemImage: "2.circle")
                            .bold()
                        Text("Today Is")
                        Text("Tuesday")
                    } else if day == 3 {
                        Label("Timetable", systemImage: "3.circle")
                            .bold()
                        Text("Today Is")
                        Text("Wednesday")
                    } else if day == 4 {
                        Label("Timetable", systemImage: "4.circle")
                            .bold()
                        Text("Today Is")
                        Text("Thursday")
                    } else if day == 5 {
                        Label("Timetable", systemImage: "5.circle")
                            .bold()
                        Text("Today Is")
                        Text("Friday")
                    } else if day == 6 {
                        Label("Timetable", systemImage: "6.circle")
                            .bold()
                        Text("Today Is")
                        Text("Saturday")
                    } else if day == 7 {
                        Label("Timetable", systemImage: "7.circle")
                            .bold()
                        Text("Today Is")
                        Text("Sunday")
                    } else {
                        Text("Error Day Select")
                    }
                }
                Spacer()
        }
            .onAppear() {
                let date = Date()
                let formatter = DateFormatter()
                formatter.dateStyle = .full
                formatter.dateFormat = "EEEE"
                let dateOut = formatter.string(from: date)
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
            }
        case .systemMedium:
            Text("Unused")
        case .systemLarge:
            Text("Unused")
        case .systemExtraLarge:
            Text("Unused")
        case .accessoryCircular:
            Text("Unused")
        @unknown default:
            Text("Unknown Widget Type")
        }
    }
}

@main
struct Timetable_Widget_iOS: Widget {
    let kind: String = "Timetable_Widget_iOS"
    var body: some WidgetConfiguration {
        //Add The Widget To The System
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Timetable_Widget_iOSEntryView(entry: entry)
        }
        .configurationDisplayName("Timetable")
        .description("Shortcut To The App.")
        .supportedFamilies([.systemSmall, .accessoryRectangular])
    }
}

//Xcode Widget Preview View
struct Timetable_Widget_iOS_Previews: PreviewProvider {
    static var previews: some View {
        Timetable_Widget_iOSEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
