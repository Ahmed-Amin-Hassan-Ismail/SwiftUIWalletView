//
//  WalletViewModel.swift
//  AppleWallet
//
//  Created by Ahmed Amin on 06/07/2023.
//

import Foundation


final class WalletViewModel: ObservableObject {
    
    //MARK: - Properties
    
    @Published var cards: [Card] = []
    @Published var transactions: [Transaction] = []
    @Published var selectedCard: Card? = nil
    @Published var isCardPresented: Bool = false
    @Published var isCardPressed: Bool = false
    
    private let cardOffset: CGFloat = 50.0
    
    //MARK: - Init
    
    init() {
        setupCardsView()
        setupTransactionsView()
    }
    
    //MARK: - Methods
    
    private func setupCardsView() {
        
        cards.append(contentsOf: DeveloperPreview.instance.cards)
    }
    
    private func setupTransactionsView() {
        
        transactions.append(contentsOf: DeveloperPreview.instance.transactions)
    }
    
    func index(for card: Card) -> Int? {
        
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else {
            
            return nil
        }
        
        return index
    }
    
    func zIndex(for card: Card) -> Double {
        
        guard let cardIndex = index(for: card) else {
            
            return 0.0
        }
        
        return -Double(cardIndex)
    }
    
    func offset(for card: Card) -> CGSize {
        
        guard let cardIndex = index(for: card) else {
            
            return .zero
        }
        
        if isCardPressed {
            
            guard let selectedCard = selectedCard,
                  let selectedCardIndex = index(for: selectedCard) else {
                
                return .zero
            }
            
            if cardIndex >= selectedCardIndex {
                
                return .zero
            }
            
            return CGSize(width: 0, height: 1400)
        }
        
        return CGSize(width: 0, height: -(cardOffset * CGFloat(cardIndex)))
        
    }
    
    func animationWithDelay(for card: Card) -> Double {
        
        
        guard let index = index(for: card) else {
            return 0.0
        }
        
        return Double(cards.count - index) * 0.1
    }
    
    func selectSpecificCard(with card: Card) {
        isCardPressed.toggle()
        selectedCard = isCardPressed ? card : nil
    }
}
