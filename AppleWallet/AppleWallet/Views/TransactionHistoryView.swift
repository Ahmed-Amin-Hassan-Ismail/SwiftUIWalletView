//
//  TransactionHistoryView.swift
//  AppleWallet
//
//  Created by Ahmed Amin on 05/07/2023.
//

import SwiftUI

struct TransactionHistoryView: View {
    
    //MARK: - Attributes
    private var transitions: [Transaction] = DeveloperPreview.instance.transactions
    
    //MARK: - Init
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Transaction History")
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(transitions) { transition in
                        setupTransitionHistoryView(with: transition)
                    }
                }
            }
            
        }
    }
}

//MARK: - SETUP VIEW

extension TransactionHistoryView {
    
    private func setupTransitionHistoryView(with transition: Transaction) -> some View {
        
        VStack {
            
            Image(systemName: transition.icon)
                .font(.system(size: 50))
                .padding(.bottom, 10)
            
            Text(transition.merchant)
                .font(.system(.body, design: .rounded))
                .fontWeight(.bold)
            
            Text("$\(String(format: "%0.1f", transition.amount))")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
            Text(transition.date)
                .font(.system(.caption, design: .rounded))
            
        }
        .frame(width: 200, height: 300)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.2))
        )
    }
}

struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHistoryView()
    }
}
