//
//  DetailViewController.swift
//  stormy
//
//  Created by Николай Белиовский on 04/11/2018.
//  Copyright © 2018 Николай Белиовский. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate, UISearchBarDelegate {

   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    var selectedImage: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
            print("name:", imageToLoad)
        }
        // Do any additional setup after loading the view.
        title = selectedImage
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 5.0
        scrollView.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {

        if scrollView.zoomScale == 1.0{navigationController?.setNavigationBarHidden(false, animated: true)}
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        if scrollView.isZoomBouncing {print("BOUNCE!")}
               return self.imageView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
