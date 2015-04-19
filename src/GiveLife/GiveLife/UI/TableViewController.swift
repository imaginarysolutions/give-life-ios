//
//  TableViewController.swift
//  GiveLife
//
//  Created by Ivan Fabijanovic on 19/04/15.
//  Copyright (c) 2015 Imaginary Solutions. All rights reserved.
//

import UIKit
import Parse

class TableViewController: UITableViewController {

    var measure: Measure?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = Measure.query()!
        query.orderByDescending("createdAt")
        query.getFirstObjectInBackgroundWithBlock {
            (object: PFObject?, error: NSError?) -> Void in
            if error == nil {
                self.measure = object as? Measure
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.measure = nil
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.measure != nil ? 1 : 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.measure != nil ? self.measure!.measures.count : 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MeasureCell", forIndexPath: indexPath) as! UITableViewCell

        let measures = self.measure!.measures[indexPath.row]
        let name = measures["name"]!
        let percent = measures["percent"]!
        
        cell.textLabel!.text = name
        cell.detailTextLabel!.text = "\(count(percent) > 5 ? percent.substringToIndex(advance(percent.startIndex, 5)) : percent)%"
        
        return cell
    }

}
