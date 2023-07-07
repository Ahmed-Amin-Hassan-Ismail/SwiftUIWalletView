//
//  WalletView.swift
//  AppleWallet
//
//  Created by Ahmed Amin on 05/07/2023.
//

import SwiftUI

struct WalletView: View {
    
    //MARK: - Attributes
    
    @StateObject private var viewModel = WalletViewModel()
    
    //MARK: - Body
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                ZStack {
                    if viewModel.isCardPresented {
                        ForEach(viewModel.cards) { card in
                            CardView(card: card)
                                .offset(viewModel.offset(for: card))
                                .zIndex(viewModel.zIndex(for: card))
                                .transition(cardTransition())
                                .animation(animationWithTransition(for: card))
                                .gesture(tapSelectedCard(card: card))
                        }
                    }
                }
                
                
                if viewModel.isCardPressed {
                    
                    TransactionHistoryView(transactions: viewModel.transactions)
                        .padding(.top, 10)
                        .transition(.move(edge: .bottom))
                        .animation(Animation.easeInOut(duration: 0.15).delay(0.4))
                }
            }
            .padding(.horizontal)
            .navigationTitle("Wallet")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(.title))
                }
            }
            .onAppear {
                
                viewModel.isCardPresented.toggle()
            }
        }
    }
}


extension WalletView {
    
    
    private func cardTransition() -> AnyTransition {
        
        AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity)
    }
    
    private func animationWithTransition(for card: Card) -> Animation {
        
        Animation.spring(response: 0.1, dampingFraction: 0.8, blendDuration: 0.3).delay(viewModel.animationWithDelay(for: card))
        
    }
    
    private func tapSelectedCard(card: Card) -> _EndedGesture<TapGesture> {
        
        TapGesture()
            .onEnded { _ in
                withAnimation(.easeOut(duration: 1.0)) {
                    viewModel.selectSpecificCard(with: card)
                }
            }
    }
}



struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
