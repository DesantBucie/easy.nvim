//
//  main.swift
//  mac-keyboard-detector
//
//  Created by dsnt on 17/11/2021.
//
import Carbon

let kbd = LMGetKbdType()
if(kbd == 49){
    print("US")
}
else {
    print("UK")
}


