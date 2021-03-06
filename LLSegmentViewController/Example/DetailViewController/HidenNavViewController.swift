//
//  HidenNavViewController.swift
//  LLSegmentViewController
//
//  Created by apple on 2019/1/24.
//  Copyright © 2019年 lilin. All rights reserved.
//

import UIKit

class HidenNavViewController: PersonDetailViewController,UIGestureRecognizerDelegate {
    private var progress:CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        initCustomNavBar()
    }
    
    override func scrollView(scrollView: LLContainerScrollView, dragToMinimumHeight progress: CGFloat) {
        self.progress = progress
        customNavBar.alpha = progress
    }
}


extension HidenNavViewController{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
}
