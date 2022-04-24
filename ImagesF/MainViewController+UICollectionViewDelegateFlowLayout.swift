//
//  MainViewController+UICollectionViewDelegateFlowLayout.swift
//  ImagesF
//
//  Created by andriy kruglyanko on 22.04.2022.
//

import UIKit

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == bannerCollectionView {
            let size = collectionView.bounds.size
            return size
        } else {
            if indexPath == largePhotoIndexPath {
                let curI : String = imRes[indexPath.section].imageNames[indexPath.row].imageName
                var  photo: UIImage?
                if let p = UIImage.init(named: "\(String(describing: curI))") {
                    photo = p
                }
                var size = collectionView.bounds.size
                size.height -= (Constants.sectionInsets.top + Constants.sectionInsets.right)
                size.width -= (Constants.sectionInsets.left + Constants.sectionInsets.right)
                return self.sizeToFillWidth(of: size, image : photo)
            }
            
            if buttonClickedLast == ButtonClicked.home {
                let paddingSpace = Constants.sectionInsets.left * (Constants.numberOfElementsInLine + 1)
                let availableWidth = view.frame.width - paddingSpace
                let widthPerItem = availableWidth / Constants.numberOfElementsInLine
                
                return CGSize(width: widthPerItem, height: widthPerItem)
            } else {
                let curI : String = imRes[indexPath.section].imageNames[indexPath.row].imageName
                var  photo: UIImage?
                if let p = UIImage.init(named: "\(String(describing: curI))") {
                    photo = p
                }
                var size = collectionView.bounds.size
                size.height -= (Constants.sectionInsets.top + Constants.sectionInsets.right)
                size.width -= (Constants.sectionInsets.left + Constants.sectionInsets.right)
                return self.sizeToFillWidth(of: size, image : photo)
            }
            
            
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == bannerCollectionView  {
            return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        } else {
            return Constants.sectionInsets
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == bannerCollectionView {
            return 0.0
        } else {
            return Constants.sectionInsets.left
        }
      
    }
    
    func sizeToFillWidth(of size: CGSize, image : UIImage?) -> CGSize {
      guard let thumbnail = image else {
        return size
      }

      let imageSize = thumbnail.size
      var returnSize = size

      let aspectRatio = imageSize.width / imageSize.height

      returnSize.height = returnSize.width / aspectRatio

      if returnSize.height > size.height {
        returnSize.height = size.height
        returnSize.width = size.height * aspectRatio
      }

      return returnSize
    }
    
}
