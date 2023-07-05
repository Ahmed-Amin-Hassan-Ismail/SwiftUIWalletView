//
//  CardViewModel.swift
//  AppleWallet
//
//  Created by Ahmed Amin on 05/07/2023.
//

import Foundation
import Combine



final class CardViewModel: ObservableObject {
    
    //MARK: - Properties
    
    @Published private(set) var cards: [Card] = []
    
    
    //MARK: - Init
    
    init() {
        
        //setupCards()
    }
    
    
    //MARK: - Methods
    
    private func setupCards() {
        
        cards.append(contentsOf: DeveloperPreview.instance.cards)
    }
    
}
