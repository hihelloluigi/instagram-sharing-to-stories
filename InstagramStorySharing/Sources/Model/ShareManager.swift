//
//  ShareManager.swift
//  InstagramStorySharing
//
//  Created by Luigi Aiello on 05/05/21.
//

import UIKit

/// Guide
// https://developers.facebook.com/docs/instagram/sharing-to-stories/

class ShareManager {
    
    // MARK: - Variables
    lazy private var urlScheme = URL(string: "instagram-stories://share?source_application=c\(Bundle.main.bundleIdentifier ?? "")")
    
    // MARK: - Helpers
    func canOpenInstagram() -> Bool {
        guard let scheme = urlScheme else {
            return false
        }
        
        return UIApplication.shared.canOpenURL(scheme)
    }
    
    // Condivisione di una risorsa di sfondo
    func shareBackgroundImage(_ backgroundImage: Data) {
        // Verify app can open custom URL scheme, open if able
        guard canOpenInstagram() else {
            // Throw errors
            return
        }
        
        // Assign background image asset to pasteboard
        let pasteboardItems: [[String: Any]] = [["com.instagram.sharedSticker.backgroundImage": backgroundImage]]
        
        // Share
        share(items: pasteboardItems)
    }
    
    // Condivisione di una risorsa adesivo
    func shareStickerImage(_ stickerImage: Data, backgroundTopColor top: String, backgroundBottomColor bottom : String) {
        // Verify app can open custom URL scheme, open if able
        guard canOpenInstagram() else {
            // Throw errors
            return
        }
        
        // Assign background image asset to pasteboard
        let pasteboardItems: [[String: Any]] = [["com.instagram.sharedSticker.stickerImage": stickerImage,
                                                  "com.instagram.sharedSticker.backgroundTopColor": top,
                                                  "com.instagram.sharedSticker.backgroundBottomColor": bottom]]
        
        // Share
        share(items: pasteboardItems)
    }
    
    // Condivisione di una risorsa di sfondo e una risorsa adesivo
    func shareBackgroundAndStickerImage(_ backgroundImage: Data, stickerImage: Data) {
        // Verify app can open custom URL scheme, open if able
        guard canOpenInstagram() else {
            // Throw errors
            return
        }
        
        // Assign background image asset to pasteboard
        let pasteboardItems: [[String: Any]] = [["com.instagram.sharedSticker.backgroundImage": backgroundImage,
                                                  "com.instagram.sharedSticker.stickerImage": stickerImage]]
        
        // Share
        share(items: pasteboardItems)
    }
    
    private func share(items: [[String: Any]]) {
        guard let scheme = urlScheme else {
            return
        }
        
        let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(60*5)]
        
        UIPasteboard.general.setItems(items, options: pasteboardOptions)
        UIApplication.shared.open(scheme, options: [:], completionHandler: nil)
    }
}
