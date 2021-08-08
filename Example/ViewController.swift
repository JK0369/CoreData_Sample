//
//  ViewController.swift
//  Example
//
//  Created by 김종권 on 2021/08/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var names: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    @IBAction func didTapAddButton(_ sender: Any) {
        let alert = UIAlertController(title: "새 이름",
                                      message: "새 이름 추가",
                                      preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "저장",
                                       style: .default) { [weak self] _ in
            guard let textField = alert.textFields?.first,
                  let nameToSave = textField.text else {
                return
            }
            self?.names.append(nameToSave)
            self?.tableView.reloadData()
        }

        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = names[indexPath.row]
        return cell!
    }
}
