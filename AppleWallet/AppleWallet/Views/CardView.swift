//
//  CardView.swift
//  AppleWallet
//
//  Created by Ahmed Amin on 05/07/2023.
//

import SwiftUI

struct CardView: View {
    
    //MARK: - Attributes
    
    private var card: Card
    
    //MARK: - Init
    
    init(card: Card) {
        self.card = card
    }
    
    //MARK: - Body
    
    var body: some View {
        
        Image(card.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(cardContent, alignment: .bottomLeading)
            .shadow(color: .gray,
                    radius: 1.0, x: 0, y: 1.0)
    }
}

//MARK: - SETUP VIEW

extension CardView {
    
    private var cardContent: some View {
        
        VStack(alignment: .leading) {
            
            Text(card.number)
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            HStack {
                
                Text(card.name)
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                
                Text("Valid Thru")
                    .font(.system(.footnote, design: .rounded))
                
                Text(card.expiryDate)
                    .font(.system(.footnote, design: .rounded))
            }
            .foregroundColor(.white)
            
        }
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: dev.cards[0])
    }
}
