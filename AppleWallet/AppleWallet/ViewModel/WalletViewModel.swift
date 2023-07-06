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
        
        return CGSize(width: 0, height: -(cardOffset * CGFloat(cardIndex)))
        
    }
    
}
