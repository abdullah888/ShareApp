//
//  ViewController.swift
//  Shareapp
//
//  Created by abdullah FH  on 20/10/1442 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var ShareOutLet: UIButton!
    @IBOutlet weak var ButtonOutLet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ShareOutLet.layer.cornerRadius = 12
        self.ButtonOutLet.layer.cornerRadius = 12
        self.hideKeyboardWhenTappedAround()
    }
    
    
    @IBAction func AddImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.modalPresentationStyle = .overFullScreen
        self.present(picker, animated: true, completion: nil)
        
        
    }
    
    
    
    @IBAction func ButtonAction(_ sender: Any) {
        let text = self.TextField.text
        let image = self.ImageView.image
        
        let shareAll = [text as Any , image!]
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        ImageView.image = image
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated: true, completion: nil)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
