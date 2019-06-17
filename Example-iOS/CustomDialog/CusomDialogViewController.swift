//
//  CusomDialogViewController.swift
//  Example-iOS
//
//  Created by Arka Softwares on 17/06/19.
//  Copyright © 2019 Arka Softwares. All rights reserved.
//

import UIKit

class CusomDialogViewController: UIViewController, DialogDeligate {

    @IBOutlet weak var dialogValue: UILabel!
    
    // Init dialogVC
    fileprivate let dialogVC = DialogViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegate
        dialogVC.delegate = self 
        dialogVC.dialogTitle = "Custom Title"
        //Add Dialog in current VC
        addDialogVC()
    }
    
    fileprivate func addDialogVC() {
        // 2- Add bottomSheetVC as a child view
        self.addChild(dialogVC)
        self.view.addSubview(dialogVC.view)
        dialogVC.didMove(toParent: self)
        
        // 3- Adjust bottomSheet frame and initial position.
        let height = view.frame.height
        let width  = view.frame.width
        dialogVC.view.frame = CGRect(origin: CGPoint(x:0, y:self.view.frame.maxY), size: CGSize(width:width, height:height))
    }
    @IBAction func openDialog(_ sender: Any) {
        dialogVC.open()
    }
    

    //Impliment delegate function which returns user entered string from dialog
    func submit(value: String?) {
        dialogValue.text = value
    }

}
