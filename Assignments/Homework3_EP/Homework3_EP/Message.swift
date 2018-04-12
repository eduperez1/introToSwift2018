//
//  Message.swift
//  Homework3_EP
//
//  Created by Eduardo Perez Cortes on 4/9/18.
//  Copyright © 2018 Eduardo Perez Cortes. All rights reserved.
//

import UIKit

enum MessageState: Int {
    case Pending = 0
    case Sent = 1
    case Failed = 2
    
    
    var txt: String {
        switch self {
        case .Pending:
            print("Pending")
            break
        case .Sent:
            print("Sent")
            break
        case .Failed:
            print("Failed")
            
        }
        return self.txt
    }
}

struct Message {
    
    var fromName: String
    var body: String
    var state: MessageState
}


extension Message {

    static var defaultData: [Message] {
        let maria = Message(fromName: "Maria", body: "We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul. We are in this for the long haul.", state: .Pending)
       let antonio = Message(fromName: "Antonio", body: "Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde. Vamos jugar poker este Sabado a las diez de la tarde.", state: .Sent)
        let ricardo = Message(fromName: "Ricardo", body: "I need to go to the grocery store, I have no food at home. I need to go to the grocery store, I have no food at home. I need to go to the grocery store, I have no food at home. I need to go to the grocery store, I have no food at home. I need to go to the grocery store, I have no food at home. I need to go to the grocery store, I have no food at home. I need to go to the grocery store, I have no food at home.", state: .Failed)
        let jessica = Message(fromName: "Jessica", body: "Would you like to go to the movies tomorrow, quiero ver esa pelicula. Would you like to go to the movies tomorrow, quiero ver esa pelicula. Would you like to go to the movies tomorrow, quiero ver esa pelicula. Would you like to go to the movies tomorrow, quiero ver esa pelicula. Would you like to go to the movies tomorrow, quiero ver esa pelicula. Would you like to go to the movies tomorrow, quiero ver esa pelicula.", state: .Pending)
        let alex = Message(fromName: "Alex", body: "Voy para la casa de mi mai esta manana. Voy para la casa de mi mai esta manana. Voy para la casa de mi mai esta manana. Voy para la casa de mi mai esta manana. Voy para la casa de mi mai esta manana. Voy para la casa de mi mai esta manana. Voy para la casa de mi mai esta manana. Voy para la casa de mi mai esta manana.", state:.Sent)
        return [maria, antonio, ricardo, jessica, alex]
    }




}

