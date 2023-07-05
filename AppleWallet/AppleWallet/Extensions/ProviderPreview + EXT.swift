//
//  ProviderPreview + EXT.swift
//  AppleWallet
//
//  Created by Ahmed Amin on 05/07/2023.
//

import SwiftUI



extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        
        return DeveloperPreview.instance
    }
    
}


final class DeveloperPreview {
    
    //MARK: - Singleton
    
    static let instance: DeveloperPreview = DeveloperPreview()
    
    
    private init() { }
    
    let cards = [
        Card(name: "James Hayward", type: .visa, number: "4242 4242 4242 4242", expiryDate: "3/23"),
        Card(name: "Cassie Emily", type: .master, number: "5353 5353 5353 5353", expiryDate: "10/21"),
        Card(name: "Adam Green", type: .americanExpress, number: "3737 3737 3737 3737", expiryDate: "8/22"),
        Card(name: "Donald Wayne", type: .chase, number: "6363 6263 6362 6111", expiryDate: "11/23"),
        Card(name: "Gloria Jane", type: .discover, number: "6011 0009 9013 9424", expiryDate: "5/24")
    ]
    
    let testTransactions = [
        Transaction(merchant: "Mushroom", amount: 120.0, date: "11/2/2020", icon: "star.circle.fill"),
        Transaction(merchant: "Amazon", amount: 50.0, date: "10/2/2020", icon: "cart.fill"),
        Transaction(merchant: "MUJI", amount: 300.0, date: "8/2/2020", icon: "app.gift.fill"),
        Transaction(merchant: "Apple", amount: 800.0, date: "4/2/2020", icon: "headphones"),
        Transaction(merchant: "Netflix", amount: 19.0, date: "11/2/2020", icon: "tv"),
        Transaction(merchant: "ANA", amount: 480.0, date: "11/2/2020", icon: "airplane")
    ]
}
