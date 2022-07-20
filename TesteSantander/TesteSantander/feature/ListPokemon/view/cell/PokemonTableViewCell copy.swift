//
//  OcsTableViewCell.swift
// TesteSantander
//
//  Created by Wildson Silva on 10/07/20.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import UIKit
import Kingfisher

protocol PokemonTableViewCellDelegate: class {
    
}

class PokemonTableViewCell: UITableViewCell {
    private var indexPath: IndexPath?
    private var pokemon: Pokemon?
    
    @IBOutlet var imgPokemon: UIImageView!
    @IBOutlet var labelNamePokemon: UILabel!
    
    weak var delegate: PokemonTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setup(pokemon: Pokemon, indexPath: IndexPath) {
        self.indexPath = indexPath
        self.pokemon = pokemon
        
        self.labelNamePokemon.text = pokemon.name?.capitalized
        let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(indexPath.row+1).png")
        imgPokemon.kf.setImage(with: url)

       
    }
    
}
