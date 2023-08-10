//
//  PokemonListCell.swift
//  PokedexApp
//
//  Created by apple on 8/8/23.
//

import SwiftUI

struct PokemonListCell: View {
    let pokemon : Pokemon
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: pokemon.sprites.front_default), content: {image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
            }, placeholder: {
                Image(systemName: "photo")
            })
            Spacer()
            Text(pokemon.name.capitalized)
                .font(.system(size: 25))
        }
        .padding()
    }
}

//struct PokemonListCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonListCell()
//    }
//}
