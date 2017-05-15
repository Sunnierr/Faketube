//
//  SettingLauncher.swift
//  Faketube
//
//  Created by Test Test on 5/15/17.
//  Copyright © 2017 Sunnier. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {


    let blackView = UIView()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()

    let cellId 

    func showSettings() {

        if let window = UIApplication.shared.keyWindow {

            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)

            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))

            window.addSubview(blackView)
            window.addSubview(collectionView)

            let height: CGFloat = 200
            let y = window.frame.height - height
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)

            blackView.frame = window.frame
            blackView.alpha = 0


            UIView.animate(withDuration: 0.88, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut,
                animations: {
                    self.blackView.alpha = 1
                    self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
                    }, completion: nil)
        }
    }

    func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0

            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height
                )
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }

    override init() {
        super.init()

        collectionView.dataSource = self
        collectionView.delegate = self
    }
}







