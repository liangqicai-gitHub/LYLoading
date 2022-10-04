//
//  ViewController.swift
//  LYLoading
//
//  Created by Sunny on 10/04/2022.
//  Copyright (c) 2022 Sunny. All rights reserved.
//

import UIKit
import LYLoading

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //功能
        view.ly_showLoading()
        
        //演示一下取图片
        //具体的  请阅读 LYLoading.podspec
        let myBundle = Bundle(for: LYLoadingView.self)
        guard
            let path = myBundle.path(forResource: "LYLoading", ofType: "bundle"),
            let assetsBundle = Bundle.init(path: path),
            let image = UIImage(named: "hhhhtest", in: assetsBundle, compatibleWith: nil)
        else {
            return
        }
        
        let imageview = UIImageView(image: image)
        view.addSubview(imageview)
        imageview.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

