//
//  ViewController.swift
//  StudentsList
//
//  Created by Gudkesh Kumar on 10/01/19.
//  Copyright © 2019 Exilant. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    
    @IBOutlet var studentArrayController: NSArrayController!
    
    private lazy var studentManager: StudentsPersistanceManager = {
        return StudentsPersistanceManager(with: "Student")
    }()
    
    @objc dynamic lazy var context: NSManagedObjectContext = {
        return studentManager.mainContext
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if let vc = segue.destinationController as? NewStudentViewController {
            vc.studentManager = studentManager
        }
    }
    
    @IBAction func deleteAction(_ sender: NSButton) {
        studentArrayController.remove(atArrangedObjectIndexes: tableView.selectedRowIndexes)
        studentManager.performViewTask { (context) in
            if context.hasChanges {
                do {
                    try context.save()
                    print("Deleted successfully")
                } catch {
                    print("Failure to delete student: \(error)")
                }
            }
        }
    }
    
    
}

