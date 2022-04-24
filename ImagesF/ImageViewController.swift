//
//  ImageViewController.swift
//  ImagesF
//
//  Created by andriy kruglyanko on 23.04.2022.
//

import UIKit

class ImageViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet weak var curImageView: UIImageView!
    
    public var curImage: ImageEl?    
    
    //@IBOutlet weak var navigBar: UINavigationBar!
    @IBOutlet weak var titleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let curI : String = curImage!.imageName
        if let im = UIImage.init(named: "\(curI)")   {
            curImageView.image = im
        }
        titleButton.setTitle(curImage!.textName, for: .normal)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
