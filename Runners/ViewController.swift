//
//  ViewController.swift
//  Runners
//
//  Created by Slava Krusevich on 3/13/19.
//  Copyright © 2019 Slava Krusevich. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    @IBOutlet var tableView: NSTableView?
    
    var race: Race?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RaceService.race { race in
            self.race = race
            
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }

    func numberOfRows(in tableView: NSTableView) -> Int {
        return race?.runners.count ?? 0
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let identifier = NSUserInterfaceItemIdentifier(rawValue: "MyView")
        let view = tableView.makeView(withIdentifier: identifier, owner: self) as! NSTableCellView
        
        let columnIndex = tableView.tableColumns.firstIndex(of: tableColumn!)
        
        if let runner = race?.runners[row] {
            func stringValue() -> String {
                switch columnIndex {
                case 0: return runner.name
                case 1: return String(runner.time)
                case 2: return String(runner.age)
                case 3: return String(runner.ranking)
                default: return ""
                }
            }
            
            view.textField?.stringValue = stringValue()
        }
        
        return view
    }
    
    
}

