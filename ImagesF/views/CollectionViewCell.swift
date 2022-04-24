//
//  CollectionViewCell.swift
//  ImagesF
//
//  Created by andriy kruglyanko on 16.04.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var curImageView: UIImageView!
    @IBOutlet weak var curLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
