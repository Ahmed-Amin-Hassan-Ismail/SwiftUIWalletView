//
//  WalletView.swift
//  AppleWallet
//
//  Created by Ahmed Amin on 05/07/2023.
//

import SwiftUI

struct WalletView: View {
    
    //MARK: - Attributes
    
    private var cards: [Card] = DeveloperPreview.instance.cards
    @State private var isCardPresented: Bool = false
    
    
    //MARK: - Body
    
    var body: some View {
        NavigationView {
            
            ZStack {
                if isCardPresented {
                    ForEach(cards) { card in
                        CardView(card: card)
                            .padding(.horizontal)
                            .zIndex(zIndex(for: card))
                            .offset(offset(for: card))
                            .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                            .animation(transitionAnimation(for: card))
                    }
                }
            }
            .navigationTitle("Wallet")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    setupTrailingButton
                }
            }
            .onAppear {
                isCardPresented.toggle()
            }
        }
    }
}

//MARK: - HELPER METHOD

extension WalletView {
    
    private func index(for card: Card) -> Int? {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else {
            return nil
        }
        
        return index
    }
    
    private func zIndex(for card: Card) -> Double {
        guard let cardIndex = index(for: card) else {
            return 0.0
        }
        
        return -Double(cardIndex)
    }
    
    private func offset(for card: Card) -> CGSize {
        guard let cardIndex = index(for: card) else {
            return CGSize.zero
        }
        
        return CGSize(width: 0, height: -50 * CGFloat(cardIndex))
    }
    
    private func transitionAnimation(for card: Card) -> Animation {
        
        var delay = 0.0
        
        if let index = index(for: card) {
            delay = Double(cards.count - index) * 0.1
        }
        
        return Animation.spring(response: 0.1,
                                dampingFraction: 0.8,
                                blendDuration: 0.2).delay(delay)
    }
    
    private var setupTrailingButton: some View {
        Button {
            // not implemented yet
        } label: {
            Image(systemName: "plus.circle.fill")
                .font(.system(.title, design: .rounded))
                .foregroundColor(.black)
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
