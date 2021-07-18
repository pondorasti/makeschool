//
//  ItemEditorViewController.swift
//  loaner
//
//  Created by Erick Sanchez on 8/17/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class ItemEditorViewController: UIViewController {
    
    var item: Item!
    
    func updateUI() {
        labelTitle.text = "Item Details"
        imageViewItem.image = item.itemImage
        textFieldItemTitle.text = item.itemTitle
        if item.notes.isEmpty {
            buttonNotes.setTitle("Add Notes", for: .normal)
        } else {
            buttonNotes.setTitle(item.notes, for: .normal)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "show item notes":
                guard let itemNotesVc = segue.destination as? ItemNotesViewController else {
                    return print("storyboard not set up correctly")
                }
                
                itemNotesVc.body = item.notes
            case "show contact info":
                guard let itemContactVc = segue.destination as? ItemContactInfoViewController else {
                    return print("storyboard not set up correctly")
                }
                
                itemContactVc.item = item
            default: break
            }
        }
    }
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var buttonLeft: UIButton!
    @IBAction func pressLeftButton(_ sender: Any) {
        let alertDiscardChanges = UIAlertController(
            title: nil,
            message: "Are you sure you want to cancel these changes?",
            preferredStyle: .actionSheet
        )
        
        let actionDiscardChanges = UIAlertAction(title: "Discard Changes", style: .destructive) { (_) in
            self.performSegue(withIdentifier: "unwind from cancel", sender: nil)
        }
        alertDiscardChanges.addAction(actionDiscardChanges)
        
        let actionCancel = UIAlertAction(title: "Continue Editing", style: .cancel)
        alertDiscardChanges.addAction(actionCancel)
        
        present(alertDiscardChanges, animated: true)
    }
    
    @IBAction func pressItemImage(_ sender: Any) {
        let photoSourceAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (_) in
            let imagePickerVc = UIImagePickerController()
            imagePickerVc.delegate = self
            imagePickerVc.allowsEditing = true
            imagePickerVc.sourceType = .savedPhotosAlbum
            
            self.present(imagePickerVc, animated: true)
        }
        photoSourceAlert.addAction(photoLibraryAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        photoSourceAlert.addAction(cancelAction)
        
        present(photoSourceAlert, animated: true)
    }
    
    @IBOutlet weak var imageViewItem: UIImageView!
    @IBOutlet weak var textFieldItemTitle: UITextField!
    @IBOutlet weak var buttonNotes: UIButton!
    @IBAction func pressNotes(_ sender: Any) {
        //TODO: present a notes view controller to edit the item's notes
    }
    
    @IBAction func pressContactInfo(_ sender: Any) {
        
        //validate the user has selected an image
        guard item.itemImage != UIImage(named: "no item image") else {
            let missingImageAlert = UIAlertController(
                title: "Adding an Item",
                message: "please select an image for the new item",
                preferredStyle: .alert
            )
            
            let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel)
            missingImageAlert.addAction(cancelAction)
            
            present(missingImageAlert, animated: true)
            return
        }
        
        //validate the user has enter a title
        guard item.itemTitle.isEmpty == false else {
            let missingImageAlert = UIAlertController(
                title: "Adding an Item",
                message: "please select enter a title for the new item",
                preferredStyle: .alert
            )
            
            let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel)
            missingImageAlert.addAction(cancelAction)
            
            present(missingImageAlert, animated: true)
            return
        }
        
        performSegue(withIdentifier: "show contact info", sender: nil)
    }
    
    @IBAction func unwindToItemEditor(_ segue: UIStoryboardSegue) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "unwind from notes":
            guard let itemNotesVc = segue.source as? ItemNotesViewController else {
                return print("storyboard not set up correctly")
            }
            
            item.notes = itemNotesVc.body
            
            updateUI()
        case "unwind from contact info":
            guard let itemContactVc = segue.source as? ItemContactInfoViewController else {
                return print("storyboard not set up correctly")
            }
            
            item = itemContactVc.item
        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
    
}

extension ItemEditorViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        
        guard let pickedImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage else {
            return print("failed to get image")
        }
        
        let fixedImage = pickedImage.applyFixedOrientation
        item.itemImage = fixedImage
        
        updateUI()
        
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

extension ItemEditorViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard textField === textFieldItemTitle else {
            return
        }
        
        item.itemTitle = textField.text ?? ""
    }
}

fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}
