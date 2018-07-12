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


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        //CalendarPermissionsManager.sharedInstance.getPermissions();
        var store = EKEventStore()
        
        store.requestAccess(to: .event, completion: {
            (success, error) -> Void in
            print("Got permission = \(success); error = \(error)")
        });
        LiftCalendar.init().loadCalendars();
        LiftCalendar.init().getNextEvent();
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

