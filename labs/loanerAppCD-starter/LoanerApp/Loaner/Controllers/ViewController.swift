//
//  ViewController.swift
//  loaner
//
//  Created by Erick Sanchez on 8/15/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var items: [Item] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up collection view layout to be half of the screen width and with some padding
        let flow = UICollectionViewFlowLayout()
        let screenSize = view.bounds.size
        let horizontalPadding: CGFloat = 8
        let verticalPadding: CGFloat = 12
        flow.itemSize = CGSize(width: screenSize.width / 2 - horizontalPadding * 2, height: screenSize.width / 2 - verticalPadding * 2)
        flow.sectionInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
        collectionView.collectionViewLayout = flow
    }
    
    func createNewItem() -> Item {
        return Item(itemTitle: "Untitled Item")
    }
    
    func add(saved item: Item) {
        items.insert(item, at: 0)
        collectionView.insertItems(at: [IndexPath(row: 0, section: 0)])
    }
    
    func markItemAsReturned(at index: Int) {
        deleteItem(at: index)
    }
    
    func deleteItem(at index: Int) {
        items.remove(at: index)
        collectionView.deleteItems(at: [IndexPath(row: index, section: 0)])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "show detailed item":
                guard let detailedItemVc = segue.destination as? ItemDetailedViewController else {
                    return print("storyboard not set up correctly")
                }
                
                guard
                    let collectionViewCell = sender as? UICollectionViewCell,
                    let indexPath = collectionView.indexPath(for: collectionViewCell) else {
                        return print("'show detailed item' was performed by a non-collection view cell")
                }
                
                let selectedItem = items[indexPath.row]
                detailedItemVc.item = selectedItem
            case "show new item":
                guard let itemEditorVc = segue.destination as? ItemEditorViewController else {
                    return print("storyboard not set up correctly")
                }
                
                let newItem = createNewItem()
                itemEditorVc.item = newItem
            default: break
            }
        }
    }
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        guard let identifier = segue.identifier else {
            return
        }
        
        switch identifier {
        case "unwind from back":
            break
        case "unwind from trash":
            guard
                let selectedIndexPaths = collectionView.indexPathsForSelectedItems,
                let selectedItemIndexPath = selectedIndexPaths.first else {
                    return
            }
            
            deleteItem(at: selectedItemIndexPath.row)
        case "unwind from mark as returned":
            guard
                let selectedIndexPaths = collectionView.indexPathsForSelectedItems,
                let selectedItemIndexPath = selectedIndexPaths.first else {
                    return
            }
            
            markItemAsReturned(at: selectedItemIndexPath.row)
        case "unwind from saving new item":
            guard let itemContactVc = segue.source as? ItemContactInfoViewController else {
                return print("storyboard not set up correctly")
            }
            
            add(saved: itemContactVc.item)
        default:
            break
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item cell", for: indexPath) as! ItemCollectionViewCell
        
        let item = items[indexPath.row]
        cell.configure(item)
        
        return cell
    }
}

