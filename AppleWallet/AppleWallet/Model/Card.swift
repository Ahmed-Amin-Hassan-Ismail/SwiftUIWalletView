//
//  Card.swift
//  AppleWallet
//
//  Created by Ahmed Amin on 05/07/2023.
//

import Foundation



struct Card: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var type: CardType
    var number: String
    var expiryDate: String
    var image: String {
        return type.rawValue
    }
}
