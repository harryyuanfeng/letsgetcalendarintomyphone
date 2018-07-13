//
//  AppDelegate.swift
//  calendar
//
//  Created by harryfeng on 2018-07-11.
//  Copyright © 2018 harryfeng. All rights reserved.
//

import Cocoa
import EventKit


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    var lcaldaar: LiftCalendar!;
    var events : [EKEvent]! = nil;
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        //CalendarPermissionsManager.sharedInstance.getPermissions();
        var store = EKEventStore()
        
        store.requestAccess(to: .event, completion: {
            (success, error) -> Void in
            print("Got permission = \(success); error = \(error)")
        });
        
        var timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        self.lcaldaar = LiftCalendar.init();
        self.lcaldaar.loadCalendars();
        
        
    }
    
    // must be internal or public.
    @objc func update() {
        // Something cool
        events = self.lcaldaar.getUpcomingEvents();
        let now = Date();
        for event in events {
            let eventDate = event.startDate as Date;
            let difference = eventDate.timeIntervalSince(now);
            print(event.title);
            print(difference);
            print(difference < 300 && difference > 293);
        }
    }
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

