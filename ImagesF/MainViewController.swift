//
//  MainViewController.swift
//  ImagesF
//
//  Created by andriy kruglyanko on 16.04.2022.
//

import UIKit
import CHIPageControl

class MainViewController: UIViewController {
       
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    var refreshControl: UIRefreshControl!
    @IBOutlet weak var customPageControl: CHIPageControlJaloro!
    var curImage: ImageEl?
    enum ButtonClicked : Int {
        case home = 0
        case my = 1
        case best = 2
    }
    var buttonClickedLast = ButtonClicked.home
    static var bannerImages: [UIImage?] = [UIImage.init(named: "13_10"), UIImage.init(named: "13_12"), UIImage.init(named: "13_13")]
    var itemsImages = [UIImage]()
    fileprivate(set) var contents: [String] = []
    var imRes : [ImageResults] = [ImageResults.init(sectionName: "category_1", imageNames: [ImageEl.init(textName: "1", imageName: "0_1"),
                                                                                            ImageEl.init(textName: "3", imageName: "0_3"),
                                                                                            ImageEl.init(textName: "6", imageName: "0_6"),
                                                                                            ImageEl.init(textName: "8", imageName: "0_8"),
                                                                                            ImageEl.init(textName: "4", imageName: "0_4"),
                                                                                            ImageEl.init(textName: "15", imageName: "0_15"),
                                                                                            ImageEl.init(textName: "11", imageName: "0_11"),
                                                                                            ImageEl.init(textName: "12", imageName: "0_12"),
                                                                                            ImageEl.init(textName: "5", imageName: "0_5")]),
                                                                                                                                          ImageResults.init(sectionName: "category_2", imageNames: [ImageEl.init(textName: "13", imageName: "0_13"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "2", imageName: "0_2"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "5", imageName: "0_5"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "7", imageName: "0_7"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "3", imageName: "0_3"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "14", imageName: "0_14"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "10", imageName: "0_10"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "11", imageName: "0_11"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "4", imageName: "0_4")]),
                                                                                                                                          ImageResults.init(sectionName: "category_3", imageNames: [ImageEl.init(textName: "1", imageName: "0_1"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "3", imageName: "0_3"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "6", imageName: "0_6"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "8", imageName: "0_8"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "4", imageName: "0_4"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "15", imageName: "0_15"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "11", imageName: "0_11"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "12", imageName: "0_12"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "5", imageName: "0_5")]),
                                                                                                                                          ImageResults.init(sectionName: "category_4", imageNames: [ImageEl.init(textName: "13", imageName: "0_13"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "2", imageName: "0_2"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "5", imageName: "0_5"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "7", imageName: "0_7"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "3", imageName: "0_3"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "14", imageName: "0_14"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "10", imageName: "0_10"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "11", imageName: "0_11"),
                                                                                                                                                                                                                                        ImageEl.init(textName: "4", imageName: "0_4")]),
]
    static var imResHome : [ImageResults] = [ImageResults.init(sectionName: "category_1", imageNames: [ImageEl.init(textName: "1", imageName: "0_1"),
                                                                                                  ImageEl.init(textName: "3", imageName: "0_3"),
                                                                                                  ImageEl.init(textName: "6", imageName: "0_6"),
                                                                                                  ImageEl.init(textName: "8", imageName: "0_8"),
                                                                                                  ImageEl.init(textName: "4", imageName: "0_4"),
                                                                                                  ImageEl.init(textName: "15", imageName: "0_15"),
                                                                                                  ImageEl.init(textName: "11", imageName: "0_11"),
                                                                                                  ImageEl.init(textName: "12", imageName: "0_12"),
                                                                                                  ImageEl.init(textName: "5", imageName: "0_5")]),
                                                                                                                                                ImageResults.init(sectionName: "category_2", imageNames: [ImageEl.init(textName: "13", imageName: "0_13"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "2", imageName: "0_2"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "5", imageName: "0_5"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "7", imageName: "0_7"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "3", imageName: "0_3"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "14", imageName: "0_14"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "10", imageName: "0_10"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "11", imageName: "0_11"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "4", imageName: "0_4")]),
                                                                                                                                                ImageResults.init(sectionName: "category_3", imageNames: [ImageEl.init(textName: "1", imageName: "0_1"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "3", imageName: "0_3"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "6", imageName: "0_6"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "8", imageName: "0_8"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "4", imageName: "0_4"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "15", imageName: "0_15"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "11", imageName: "0_11"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "12", imageName: "0_12"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "5", imageName: "0_5")]),
                                                                                                                                                ImageResults.init(sectionName: "category_4", imageNames: [ImageEl.init(textName: "13", imageName: "0_13"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "2", imageName: "0_2"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "5", imageName: "0_5"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "7", imageName: "0_7"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "3", imageName: "0_3"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "14", imageName: "0_14"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "10", imageName: "0_10"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "11", imageName: "0_11"),
                                                                                                                                                                                                                                              ImageEl.init(textName: "4", imageName: "0_4")]),
    ]
    static var imResMyImages : [ImageResults] = [ImageResults.init(sectionName: "My Images", imageNames: [ImageEl.init(textName: "10_2", imageName: "10_2"),
                                                                                                  ImageEl.init(textName: "10_3", imageName: "10_3"),
                                                                                                  ImageEl.init(textName: "10_4", imageName: "10_4"),
                                                                                                  ImageEl.init(textName: "10_5", imageName: "10_5"),
                                                                                                  ImageEl.init(textName: "10_6", imageName: "10_6"),
                                                                                                  ImageEl.init(textName: "10_7", imageName: "10_7"),
                                                                                                  ImageEl.init(textName: "10_8", imageName: "10_8"),
                                                                                                  ImageEl.init(textName: "10_9", imageName: "10_9"),
                                                                                                         ImageEl.init(textName: "10_10", imageName: "10_10"),
                                                                                                         ImageEl.init(textName: "10_12", imageName: "10_12"),
                                                                                                  ImageEl.init(textName: "10_18", imageName: "10_18")])
                                                                                                                                                
    ]
    static var imResBestImages : [ImageResults] = [ImageResults.init(sectionName: "Best Images", imageNames: [ImageEl.init(textName: "13_1", imageName: "13_1"),
                                                                                                  ImageEl.init(textName: "13_2", imageName: "13_2"),
                                                                                                  ImageEl.init(textName: "13_3", imageName: "13_3"),
                                                                                                  ImageEl.init(textName: "13_6", imageName: "13_6"),
                                                                                                  ImageEl.init(textName: "13_10", imageName: "13_10"),
                                                                                                  ImageEl.init(textName: "13_12", imageName: "13_12"),
                                                                                                  ImageEl.init(textName: "13_13", imageName: "13_13")])
    ]
    
    
    enum Constants {
        static let relativeCellSize: CGFloat = 0.9
        static let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
        static let numberOfElementsInLine: CGFloat = 3.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imRes = MainViewController.imResHome
        if let layout = bannerCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 0
        }
        bannerCollectionView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "bannerCollectionViewCell")
        itemsCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewCell")
        
        refreshControl = UIRefreshControl()
        refreshControl.bounds = CGRect.init(x: refreshControl.bounds.origin.x - 12, y: refreshControl.bounds.origin.y, width: refreshControl.bounds.size.width, height: refreshControl.bounds.size.height)
        
        refreshControl.tintColor = .darkGray
        refreshControl.addTarget(self, action: #selector(didRefresh),
        for: .valueChanged)
        itemsCollectionView.refreshControl = refreshControl
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        itemsCollectionView.collectionViewLayout.invalidateLayout()
        itemsCollectionView.layoutIfNeeded()
        itemsCollectionView.reloadData()
        bannerCollectionView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func scrollToNext() {
        guard let collectionView = self.bannerCollectionView else { return }
        let current = self.currentIdx()
        guard current >= 0 else { return }
        let maxPages = 3
        guard maxPages > 1 else { return }
        if current == maxPages - 1 {
            collectionView.scrollRectToVisible(
                CGRect(x: 0, y: 0, width: collectionView.bounds.maxX, height: 1), animated: true)
            return
        }
        let nextPage = min(current + 1, maxPages - 1)
        let width = collectionView.bounds.maxX
        let targetRect = CGRect(x: CGFloat(nextPage) * width, y: 0, width: collectionView.bounds.maxX, height: 1)
        collectionView.scrollRectToVisible(targetRect, animated: true)
    }
    
    func currentIdx() -> Int {
        guard let collectionView = self.bannerCollectionView else { return -1 }
        let offset = collectionView.contentOffset
        let width = collectionView.bounds.maxX
        let idx: Int = Int(round(offset.x / width))
        return idx
    }
    
    @objc
    func didRefresh() {
        guard let collectionView = itemsCollectionView ,
            let refreshControl = collectionView.refreshControl else { return }

        // The call to asyncAfter here is only to simulate a half second network delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            refreshControl.endRefreshing()
            
            self.itemsCollectionView.performBatchUpdates({
                DispatchQueue.main.async {
                    self.itemsCollectionView?.reloadData()
                }
            })
        }
    }
    
    var largePhotoIndexPath: IndexPath? {
      didSet {
        var indexPaths:[IndexPath] = []
        
        if let largePhotoIndexPath = largePhotoIndexPath {
          indexPaths.append(largePhotoIndexPath)
        }
        
        if let oldValue = oldValue {
          indexPaths.append(oldValue)
        }
        
          itemsCollectionView.performBatchUpdates {
          self.itemsCollectionView.reloadItems(at: indexPaths)
        } completion: { _ in
          if let largePhotoIndexPath = self.largePhotoIndexPath {
            self.itemsCollectionView.scrollToItem(at: largePhotoIndexPath, at: .centeredVertically, animated: true)
          }
        }

      }
    }

    fileprivate func getContent() {
        let pathToDir1 = Bundle.main.resourcePath! + "/images/" //+ "/Stickers/1";
        guard let dirURL = URL.init(string: pathToDir1) else { return  }
        do {
            let urls = try FileManager.default.contentsOfDirectory(at: dirURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            if urls.count > 0 {
                for url in urls {
                    let clearURL = url.deletingPathExtension()
                    guard let itemName = clearURL.pathComponents.last else { continue }
                    self.contents.append(itemName)
                }
            }
        }
        catch let error {
            print("File: \(#file)\nFunction: \(#function)\nLine: \(#line)\nError: \(error.localizedDescription)")
        }
    }
    
    @IBAction func homeClicked(_ sender: Any) {
        buttonClickedLast = ButtonClicked.home
        imRes = MainViewController.imResHome
        itemsCollectionView.reloadData()
    }
    
    @IBAction func myImagesClicked(_ sender: Any) {
        buttonClickedLast = ButtonClicked.my
        imRes = MainViewController.imResMyImages
        itemsCollectionView.reloadData()
        
    }
    
    @IBAction func bestImagesClicked(_ sender: Any) {
        buttonClickedLast = ButtonClicked.best
        imRes = MainViewController.imResBestImages
        itemsCollectionView.reloadData()
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toDetails" {
            if let vc = segue.destination as? ImageViewController {
                vc.curImage = curImage
            }
        }
        
    }
    
}

