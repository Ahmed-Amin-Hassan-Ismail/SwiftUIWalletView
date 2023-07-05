//
//  Transaction.swift
//  AppleWallet
//
//  Created by Ahmed Amin on 05/07/2023.
//

import Foundation


struct Transaction: Identifiable {
    
    var id: String = UUID().uuidString
    var merchant: String
    var amount: Double
    var date: String
    var icon: String = "dollarsign.circle.fill"
    
}

