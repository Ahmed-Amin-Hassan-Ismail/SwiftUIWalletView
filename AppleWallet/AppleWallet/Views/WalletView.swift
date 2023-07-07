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
                                .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                                .animation(Animation.spring(response: 0.1, dampingFraction: 0.8, blendDuration: 0.3).delay(viewModel.animationWithDelay(for: card)))
                            
                        }
                    }
                }
                .padding(.horizontal)
            }
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



struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
