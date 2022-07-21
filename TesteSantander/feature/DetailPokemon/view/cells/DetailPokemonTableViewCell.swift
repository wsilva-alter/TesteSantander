//
//  DetailItemOCsTableViewCell.swift
// TesteSantander
//
//  Created by Wildson Silva on 14/07/20.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import UIKit

class DetailPokemonTableViewCell: UITableViewCell {
    private var indexPath: IndexPath?
    private var detail: DetailPokemon?
    
    @IBOutlet weak var lblForms: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblAbilities: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgPokemon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(detail:DetailPokemon, indexPath:IndexPath){
        self.detail = detail
        self.indexPath = indexPath
        
        self.lblName.text = self.detail?.name
        
        if let id = self.detail?.id,
           let height = self.detail?.height,
           let weight = self.detail?.weight{
            self.lblId.text = "#\(id)"
            self.lblHeight.text = "\(height)"
            self.lblWeight.text = "\(weight)kg"
            
            let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
            imgPokemon.kf.setImage(with: url)
        }
       
        
        if let types = self.detail?.types{
            var _type:[String] = []
            for type in types {
                if let name = type.type?.name{
                    _type.append(name)
                }
            }
            
            lblType.text = _type.map {($0.capitalized)}.compactMap({$0.capitalized}).joined(separator: ", ")
        }
        
        if let abilities = self.detail?.abilities{
            var _abilities:[String] = []
            for ability in abilities {
                if let name = ability.ability?.name{
                    _abilities.append(name)
                }
            }
            
            lblAbilities.text = _abilities.map {($0.capitalized)}.compactMap({$0.capitalized}).joined(separator: ", ")
        }
        
        if let forms = self.detail?.forms{
            var _forms:[String] = []
            for form in forms {
                if let name = form.name{
                    _forms.append(name)
                }
            }
            
            lblForms.text = _forms.map {($0.capitalized)}.compactMap({$0.capitalized}).joined(separator: ", ")
        }
    }
    
    
}
