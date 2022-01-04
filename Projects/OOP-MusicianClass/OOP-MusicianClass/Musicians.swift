//
//  Musicians.swift
//  OOP-MusicianClass
//
//  Created by osmanyesil on 1/2/22.
//

import Foundation
enum MusicianType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
    case Violenist
}

class Musicians{
    //Property
    var name : String
    var age : Int
    var instrument : String
    var type : MusicianType
    //class constructor = Inizalizer metodu <init>
    //class oluşturuluğunda yapılacka ilk işlem
    init(nameInit : String , ageInit : Int , instrumentInit : String , musicianTypeInit :  MusicianType){
        name = nameInit
        age = ageInit
        instrument = instrumentInit
        type = musicianTypeInit
     print("musicians created")
    }    
    
    func sing(){
        print("Nothing Else Matter")
    }
    
}
