//
//  CryptoTableViewCell.swift
//  CryptoViewer
//
//  Created by Yigit Ozdamar on 22.08.2022.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var cryptoText: UILabel!
    @IBOutlet weak var cryptoPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
