//
//  DocumentPickerViewController.swift
//  Example-iOS
//
//  Created by Arka Softwares on 14/06/19.
//  Copyright © 2019 Arka Softwares. All rights reserved.
//

import UIKit

class DocumentPickerViewController: UIViewController {

    @IBOutlet weak var fileDetails: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openDocument(_ sender: Any) {
        selectDocument()
    }
    
}
extension DocumentPickerViewController:  UIDocumentPickerDelegate{
    fileprivate func selectDocument(){
        
        //    kUTTypePDF, kUTTypeText, kUTTypeRTF, kUTTypeSpreadsheet
        
        
        //    String(kUTTypePDF),String(kUTTypeRTFD),String(kUTTypeText),String(kUTTypeSpreadsheet)
        
        
        //    let test = UIDocumentPickerViewController
        
        let importMenu = UIDocumentPickerViewController(documentTypes: ["public.item"], in: .import)
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        self.present(importMenu, animated: true, completion: nil)
    }
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        let fileUrl = url as URL
        print("import result : \(fileUrl)")
        
        let theFileName = (fileUrl.absoluteString as NSString).lastPathComponent
        
        print(theFileName)
        fileDetails.text = fileUrl.absoluteString
        fileDetails.insertText("\n\n")
        
        fileDetails.insertText(theFileName)
        
        // Create a FileManager instance
        
        
    }
    
    
    public func documentMenu(_ documentMenu:UIDocumentPickerViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }
    
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
    
}
