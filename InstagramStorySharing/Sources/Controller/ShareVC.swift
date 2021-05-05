//
//  ViewController.swift
//  InstagramStorySharing
//
//  Created by Luigi Aiello on 05/05/21.
//

import UIKit

class ShareVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var shareFirstTemplateButton: UIButton!
    @IBOutlet weak var shareSecondTemplateButton: UIButton!
    @IBOutlet weak var shareThirdTemplateButton: UIButton!
    
    // MARK: - Managers
    private var manager = ShareManager()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configurations
        configureTexts()
    }


    // MARK: - Setup
    
    // MARK: - Configurations
    private func configureTexts() {
        // Buttons
        shareFirstTemplateButton.setTitle("Share 1", for: .normal)
        shareSecondTemplateButton.setTitle("Share 2", for: .normal)
        shareThirdTemplateButton.setTitle("Share 3", for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction func shareFirstTemplateDidTap(_ sender: Any) {
        guard
            let backgroundImage = UIImage(named: "test_background"),
            let backgroundData = backgroundImage.pngData()
        else {
            return
        }
        
        manager.shareBackgroundImage(backgroundData)
    }
    
    @IBAction func shareSecondTemplateDidTap(_ sender: Any) {
        guard
            let stickerImage = UIImage(named: "apple_white_logo"),
            let stickerData = stickerImage.pngData()
        else {
            return
        }
        
        manager.shareStickerImage(stickerData, backgroundTopColor: "444444", backgroundBottomColor: "333333")
    }
    
    @IBAction func shareThirdTemplateDidTap(_ sender: Any) {
        guard
            let backgroundImage = UIImage(named: "test_background"),
            let stickerImage = UIImage(named: "apple_white_logo"),
            let backgroundData = backgroundImage.pngData(),
            let stickerData = stickerImage.pngData()
        else {
            return
        }
        
        manager.shareBackgroundAndStickerImage(backgroundData, stickerImage: stickerData)
    }
}

