//
//  NewStudentViewController.swift
//  StudentsList
//
//  Created by Gudkesh Kumar on 11/01/19.
//  Copyright © 2019 Exilant. All rights reserved.
//

import Cocoa

class NewStudentViewController: NSViewController {

    var studentManager: StudentsPersistanceManager?
    
    @IBOutlet weak var addressField: NSTextField!
    @IBOutlet weak var rollNumberField: NSTextField!
    @IBOutlet weak var nameField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func saveAction(_ sender: NSButton) {
        
        defer {
             dismiss(self)
        }
        guard !nameField.stringValue.isEmpty && !rollNumberField.stringValue.isEmpty else {
            return
        }
        
        studentManager?.performViewTask({[weak self] (context) in
            context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            let student = Student(context: context)
            student.name = self?.nameField.stringValue
            student.rollNumber = (self?.rollNumberField.intValue) ?? 0
            student.address = self?.addressField.stringValue
            
            if context.hasChanges {
                do {
                    try context.save()
                    print("Saved successfully")
                } catch {
                    print("Failure to save context: \(error)")
                }
            }
        })
        
    }
    
}
