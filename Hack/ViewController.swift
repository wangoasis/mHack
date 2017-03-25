//
//  ViewController.swift
//  Hack
//
//  Created by Qing Wang on 3/25/17.
//  Copyright © 2017 Qing Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagea: UIImageView!
    
    let screenHeight = UIScreen.main.bounds.size.height
    let screenWidth  = UIScreen.main.bounds.size.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // background image
        let vImage = UIImageView(image: UIImage(named: "example.JPG"))
        vImage.frame = CGRect(
            x: 0, y: 0, width: screenWidth, height: screenHeight)
//        vImage.contentMode = UIViewContentMode.scaleAspectFit
        vImage.center = CGPoint(x: 1/2*screenWidth, y: 1/2*screenHeight)
        self.view.addSubview(vImage)
        
        // selecting from photo library
        let actionPhotoLibrary = UIButton(frame:CGRect(x:1/2*screenWidth-50, y:1/2*screenHeight+80, width: 100, height: 35))
        actionPhotoLibrary.setTitle("from library", for: UIControlState())
        actionPhotoLibrary.addTarget(self, action: #selector(ViewController.actionPhotoLibrary), for: UIControlEvents.touchUpInside)
        actionPhotoLibrary.backgroundColor = UIColor.blue
        self.view.addSubview(actionPhotoLibrary)
        
        let actionCamera = UIButton(frame:CGRect(x :1/2*screenWidth-50, y:1/2*screenHeight+120, width: 100, height: 35))
        actionCamera.setTitle("use camera", for: UIControlState())
        actionCamera.addTarget(self, action: #selector(ViewController.actionCamera), for: UIControlEvents.touchUpInside)
        actionCamera.backgroundColor = UIColor.blue
        self.view.addSubview(actionCamera)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func actionPhotoLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func actionCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
}

extension ViewController: UINavigationControllerDelegate {
    
}

extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: nil)
        print(info)
        self.imagea.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}

