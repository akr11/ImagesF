//
//  MainViewController+UICollectionViewDelegate.swift
//  ImagesF
//
//  Created by andriy kruglyanko on 23.04.2022.
//

import UIKit

extension MainViewController {
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if collectionView == bannerCollectionView {
            return false
        } else {
            if buttonClickedLast == ButtonClicked.home  {
                if largePhotoIndexPath == indexPath {
                  largePhotoIndexPath = nil
                } else {
                  largePhotoIndexPath = indexPath
                }
                return true //false
            } else {
                return true
            }
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if buttonClickedLast == ButtonClicked.home {
            let curI  = imRes[indexPath.section].imageNames[indexPath.row]
            if let im = curI as? ImageEl {
                curImage = im
            }
            performSegue(withIdentifier: "toDetails", sender: self)
        } else {
            if buttonClickedLast == ButtonClicked.home {
                
            } else {
                let curI  = imRes[indexPath.section].imageNames[indexPath.row]
                if let im = curI as? ImageEl {
                    curImage = im
                }
                performSegue(withIdentifier: "toDetails", sender: self)
            }
            
        }
    }
    
}
