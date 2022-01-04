//
//  SuperMusician.swift
//  OOP-MusicianClass
//
//  Created by osmanyesil on 1/4/22.
//

import Foundation


class SuperMusician : Musicians {
    
    override func sing() {
        super.sing()  // Miras aldığımız sınıfdan sing metodunu çağır
        print("Exit light")
    }
    
    
}


