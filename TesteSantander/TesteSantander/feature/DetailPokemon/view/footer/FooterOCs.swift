//
//  FooterOCs.swift
// TesteSantander
//
//  Created by Wildson Silva on 10/07/20.
//  Copyright © 2022 Wildson Silva. All rights reserved.
//

import UIKit

protocol FooterOCsDelegate: class {
    func didSelectedApproov()
    func didSelectedReject()
}

class FooterOCs: UIView {

    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var lbTotal: UILabel!
    @IBOutlet weak var btnAprovar: UIButton!
    @IBOutlet weak var btnRejeitar: UIButton!
    
    weak var delegate: FooterOCsDelegate?
    
    @IBAction func aprovar(_ sender: UIButton) {
        self.delegate?.didSelectedApproov()
    }
    
    @IBAction func rejeitar(_ sender: UIButton) {
        self.delegate?.didSelectedReject()
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "FooterOCs", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? UIView ?? UIView()
    }
}
