//
//  main.swift
//  OOP-MusicianClass
//
//  Created by osmanyesil on 1/2/22.
//

import Foundation


var james  = Musicians(nameInit: "Osman", ageInit: 25, instrumentInit: "Guitar" , musicianTypeInit: .LeadGuitar)


print(james.name)
print(james.type)
james.sing()



let kirk = SuperMusician(nameInit: "Kirk", ageInit: 55, instrumentInit: "Guitar", musicianTypeInit: .LeadGuitar)
kirk.sing()
