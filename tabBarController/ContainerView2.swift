//
//  ContainerView2.swift
//  viewController_containerView
//
//  Created by Luthfi Fathur Rahman on 5/31/17.
//  Copyright © 2017 Luthfi Fathur Rahman. All rights reserved.
//

import UIKit

class ContainerView2: UIViewController {
    
    @IBOutlet weak var scrollView2: UIScrollView!
    
    let posterFilm = ["batman", "belko_", "hangover", "harryPotter", "nacho_libre", "pirates", "spectre", "starTrek", "thor", "xmen"]
    let filmJudul = ["The Dark Knight", "The Belko Experiment", "Hangover", "Harry Potter and The Order of Phoenix", "Nacho Libre", "Pirates of The Carribean: Dead Men Tell No Tale", "Spectre", "Star Trek", "Thor", "X-Men Apocalypse"]
    let filmHarga = ["25000", "22000", "30000", "27000", "20000", "35000", "30000", "28000", "26000", "27000"]
    var imageViews = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView2.backgroundColor = UIColor.blue
        
        self.view.addSubview(scrollView2)
        
        let ukuranXgambar = 19
        let ukuranYgambar = 19
        let imageWidth = 93
        let imageHeight = 128
        
        var curr_imageView = UIImageView()
        for i in 0 ..< posterFilm.count {
            if imageViews.isEmpty {
                curr_imageView = UIImageView.init(frame: CGRect(x: ukuranXgambar, y:ukuranYgambar, width: imageWidth, height: imageHeight))
            } else {
                curr_imageView = UIImageView.init(frame: CGRect(x: Int(imageViews[i-1].frame.origin.x)+Int(imageViews[i-1].frame.size.width), y:ukuranYgambar, width: imageWidth, height: imageHeight))
            }
            
            curr_imageView.tag = i
            curr_imageView.image = UIImage(named: posterFilm[i])
            curr_imageView.contentMode = .scaleAspectFit
            imageViews.append(curr_imageView)
            let singleTap = UITapGestureRecognizer(target: self, action: #selector(ContainerView1.imageTapped))
            singleTap.numberOfTapsRequired = 1
            curr_imageView.isUserInteractionEnabled = true
            curr_imageView.addGestureRecognizer(singleTap)
            self.scrollView2.addSubview(curr_imageView)
        }
        
        self.scrollView2.contentSize = CGSize(width: imageViews[imageViews.count-1].frame.size.width+imageViews[imageViews.count-1].frame.origin.x+CGFloat(ukuranXgambar), height: self.scrollView2.frame.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageTapped(_ sender: UITapGestureRecognizer) {
        let senderTag = sender.view?.tag
        let senderFimJudul = self.filmJudul[senderTag!]
        let senderFilmHarga = self.filmHarga[senderTag!]
        
        let alertStatus = UIAlertController (title: "Tambahkan Ke Keranjang Belanja", message: "Judul Film: \(senderFimJudul)\nHarga Sewa: Rp \(senderFilmHarga)", preferredStyle: UIAlertControllerStyle.alert)
        alertStatus.addAction(UIAlertAction(title: "Ya", style: UIAlertActionStyle.default,handler: {(action) in
            
        }))
        alertStatus.addAction(UIAlertAction(title: "Tidak", style: UIAlertActionStyle.destructive, handler: nil))
        self.present(alertStatus, animated: true, completion: nil)
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
