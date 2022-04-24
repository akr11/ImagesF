//
//  MainViewController+DragAndDropDelegate.swift
//  ImagesF
//
//  Created by andriy kruglyanko on 20.04.2022.
//

import UIKit

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == bannerCollectionView {
            return 1
        } else {
            return imRes.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannerCollectionView {
            return MainViewController.bannerImages.count
        } else {
            return imRes[section].imageNames.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bannerCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell else {
                fatalError("Wrong cell type dequeued")
        }
            if let curI = MainViewController.bannerImages[indexPath.row] {
                cell.curImageView.image = curI
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? CollectionViewCell else {
                fatalError("Wrong cell type dequeued")
        }
            let curI : String = imRes[indexPath.section].imageNames[indexPath.row].imageName
            if let im = UIImage.init(named: "\(curI)") {
                cell.curImageView.image = im
            }
            let t : String = imRes[indexPath.section].imageNames[indexPath.row].textName
            if let tt = t as? String {
                cell.curLabel.text = tt
            }
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if collectionView == bannerCollectionView {
            return UIView.init(frame: CGRect.zero) as! UICollectionReusableView
        } else {
            switch kind {
            
            // If you weren’t using the flow layout, you wouldn’t get this behavior for free.
            case UICollectionView.elementKindSectionHeader:
              
              let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(HeaderCollectionReusableView.self)", for: indexPath)
              guard let typedHeaderView = headerView as? HeaderCollectionReusableView else { return headerView }
                let n = imRes[indexPath.section].sectionName
              typedHeaderView.titleLabel.text = n
              
              return typedHeaderView
              
            default:
              assert(false, "Invalid element")
            }
        }
        
      
    }
    
    
    
    
    
}
