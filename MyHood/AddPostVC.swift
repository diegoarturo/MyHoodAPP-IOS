//
//  AddPostVC.swift
//  MyHood
//
//  Created by Diego Torres on 2/5/17.
//  Copyright © 2017 UNAMunam. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        imagePicker = UIImagePickerController() // initialize image picker
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func addPicBtnPressed(_ sender: UIButton!) {
        sender.setTitle("", for: .normal)
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func makePostBtnPressed(_ sender: Any) {
        if let title = titleField.text , let desc = descField.text, let img = postImg.image{
            let post = Post(imagePath: "", title: title, description: desc)
            DataService.instance.addPost(post: post)
            dismiss(animated: true, completion: nil)
            
        }
    }
   

    @IBAction func cancelBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            postImg.image = image
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

}
