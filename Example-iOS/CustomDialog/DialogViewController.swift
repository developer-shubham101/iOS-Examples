//
//  DialogViewController.swift
//  Example-iOS
//
//  Created by Arka Softwares on 17/06/19.
//  Copyright © 2019 Arka Softwares. All rights reserved.
//

import UIKit


protocol DialogDeligate {
    func submit(value:String?)
}
class DialogViewController: UIViewController {
    
    @IBOutlet weak var _dialogTitle: UILabel!
    @IBOutlet weak var userValue: UITextField!
    
    var dialogTitle:String = "Dialog Title"
    
    var delegate:DialogDeligate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _dialogTitle.text = dialogTitle
    }
    
    @IBAction func didTapClose(_ sender: Any) {
        close()
        
    }
    @IBAction func didTapSubmit(_ sender: Any) {
        delegate?.submit(value: userValue.text)
        close()
    }
    
    func open(){ 
        UIView.animate(withDuration: 0.3) { [weak self] in
            let frame = self?.view.frame
            let yComponent = 0//UIScreen.main.bounds.height  //- 300
            self?.view.frame = CGRect(origin: CGPoint(x:0, y:yComponent), size: CGSize(width:frame!.width, height:frame!.height))
        }
    }
    
    fileprivate func close() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            let frame = self?.view.frame
            let yComponent = UIScreen.main.bounds.height  //- 300
            self?.view.frame = CGRect(origin: CGPoint(x:0, y:yComponent), size: CGSize(width:frame!.width, height:frame!.height))
        }
    }
    
}
