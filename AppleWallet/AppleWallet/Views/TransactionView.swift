//
//  TransactionView.swift
//  AppleWallet
//
//  Created by Ahmed Amin on 06/07/2023.
//

import SwiftUI

struct TransactionView: View {
    
    //MARK: - Attributes
    
    let transaction: Transaction
    
    //MARK: - Init
    
    init(transaction: Transaction) {
        self.transaction = transaction
    }
    
    //MARK: - Body
    
    var body: some View {
        
        VStack {
            
            Image(systemName: transaction.icon)
                .font(.system(size: 50))
                .padding(.bottom, 10)
            
            Text(transaction.merchant)
                .font(.system(.body, design: .rounded))
                .fontWeight(.bold)
            
            Text("$\(String(format: "%0.1f", transaction.amount))")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
            Text(transaction.date)
                .font(.system(.caption, design: .rounded))
            
        }
        .frame(width: 200, height: 300)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.2))
        )
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView(transaction: dev.transactions[0])
    }
}
