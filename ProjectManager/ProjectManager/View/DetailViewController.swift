//
//  DetailViewController.swift
//  ProjectManager
//
//  Created by 강경 on 2021/06/29.
//

import UIKit

enum Mode {
    case addMode, editMode
}

class DetailViewController: UIViewController {
    private let dateConverter = DateConverter()
    private var mode: Mode = .addMode
    let viewModel = DetailViewModel()
    
    @IBOutlet weak var newTitle: UITextField!
    @IBOutlet weak var newDate: UIDatePicker!
    @IBOutlet weak var newContent: UITextView!
    @IBOutlet weak var leftButton: UIButton!
    
    @IBAction func clickDoneButton(_ sender: Any) {
        if mode == .addMode {
            addNewTODO()
        } else {
            saveEditedContent()
        }
    }
    
    @IBAction func clickLeftButton(_ sender: Any) {
        if mode == .addMode {
            cancel()
        } else {
            editTODO()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        self.newTitle.isEnabled = false
        self.newDate.isEnabled = false
        self.newContent.isEditable = false
    }
    
    func updateUI() {
        if let item = viewModel.item {
            newTitle.text = item.title
            newDate.date = dateConverter.numberToDate(number: item.date)
            newContent.text = item.summary
        }
        
        if mode == .editMode {
            leftButton.setTitle("Edit", for: UIControl.State.normal)
        }
    }
    
    func changeToEditMode() {
        mode = .editMode
    }
    
    private func addNewTODO() {
        let title: String = newTitle.text!
        let date: Double = dateConverter.dateToNumber(date: newDate.date)
        let content: String = newContent.text
        
        dummy.append(TableItem(title: title, summary: content, date: date))
        print(dummy)

        dismiss(
            animated: true,
            completion: nil
        )
    }
    
    private func editTODO() {
        self.newTitle.isEnabled = true
        self.newDate.isEnabled = true
        self.newContent.isEditable = true
    }
    
    private func saveEditedContent() {
        let title: String = newTitle.text!
        let date: Double = dateConverter.dateToNumber(date: newDate.date)
        let content: String = newContent.text
//        dummy[index] = TableItem(title: title, summary: content, date: date)
        print(dummy)
    }
    
    private func cancel() {
        dismiss(
            animated: true,
            completion: nil
        )
    }
}
