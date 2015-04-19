//
//  Measure.swift
//  GiveLife
//
//  Created by Ivan Fabijanovic on 19/04/15.
//  Copyright (c) 2015 Imaginary Solutions. All rights reserved.
//

import Parse

class Measure: PFObject, PFSubclassing {
    
    // MARK: - Init
    
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    // MARK: - PFSubclassing
    
    static func parseClassName() -> String {
        return "Measure"
    }
    
    // MARK: - Properties
    
    @NSManaged var measures: Array<Dictionary<String, String>>
    
}
