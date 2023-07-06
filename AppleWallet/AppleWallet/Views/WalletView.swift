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
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .offset(viewModel.offset(for: card))
                            .zIndex(viewModel.zIndex(for: card))
                        
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
        }
    }
}



struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
