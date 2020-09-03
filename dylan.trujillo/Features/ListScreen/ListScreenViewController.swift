//
//  ListScreenViewController.swift
//  dylan.trujillo
//
//  Created by Lang Troyan on 03/09/2020.
//  Copyright © 2020 Dylan Trujillo. All rights reserved.
//

import UIKit

class ListScreenViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var tableTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    var viewModel: ListScreenViewModel?
    
    // MARK: UIViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        viewModel = ListScreenViewModel()
        inputTextField.keyboardType = .numberPad
        inputTextField.placeholder = LocaleKeys.listscreen_input_placeholder.localized
        addButton.setTitle(LocaleKeys.listscreen_add_button.localized.uppercased(), for: .normal)
        removeButton.setTitle(LocaleKeys.listscreen_remove_all_button.localized.uppercased(), for: .normal)
        sortButton.setTitle(LocaleKeys.listscreen_sort_asc_button.localized.uppercased(), for: .normal)
        tableTitleLabel.text = LocaleKeys.listscreen_table_title.localized
        
        // To close the keyboard when taping outside of it
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        // Swipe to dismiss
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismiss(from:)))
        view.addGestureRecognizer(swipeGesture)
    }

    // MARK: Class methods
    
    // Swipe right to dismiss
    @objc func dismiss(from gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func addAction() {
        guard let viewModel = viewModel, let input: Int = Int(inputTextField.text ?? "0") else { return }
        viewModel.add(input)
        tableView.reloadData()
    }
    
    @IBAction func removeAction() {
        guard let viewModel = viewModel else { return }
        viewModel.removeAll()
        tableView.reloadData()
    }
    
    @IBAction func sortAction() {
        guard let viewModel = viewModel else { return }
        viewModel.sortList()
        tableView.reloadData()
    }
    
}

// MARK: UITableViewDelegate

extension ListScreenViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        
        viewModel.remove(at: indexPath.row)
        tableView.reloadData()
    }
}

// MARK: UITableViewDataSource

extension ListScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            tableView.setEmptyMessage(LocaleKeys.listscreen_table_empty.localized)
            return 0
        }
        viewModel.getListCount() == 0 ? tableView.setEmptyMessage(LocaleKeys.listscreen_table_empty.localized) : tableView.restore()
        return viewModel.getListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel, let number = viewModel.getListValue(in: indexPath.row), let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier) as? ListCell else { return UITableViewCell() }
        cell.setBackgroundColor(indexPath.row % 2 == 0 ? UIColor.blue1 : UIColor.blue2)
        cell.setNumber(number)
        return cell
    }
    
    
}
