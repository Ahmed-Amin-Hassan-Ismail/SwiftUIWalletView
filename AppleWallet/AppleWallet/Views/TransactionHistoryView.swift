//
//  TransactionHistoryView.swift
//  AppleWallet
//
//  Created by Ahmed Amin on 05/07/2023.
//

import SwiftUI

struct TransactionHistoryView: View {
    
    //MARK: - Attributes
    
    private var transactions: [Transaction]
    
    
    init(transactions: [Transaction]) {
        self.transactions = transactions
    }
    
    //MARK: - Init
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Transaction History")
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .padding(.bottom)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(transactions) { transaction in
                      TransactionView(transaction: transaction)
                    }
                }
            }
        }
    }
}

struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHistoryView(transactions: dev.transactions)
    }
}
