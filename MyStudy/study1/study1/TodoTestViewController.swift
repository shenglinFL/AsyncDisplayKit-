//
//  TodoTestViewController.swift
//  study1
//
//  Created by 林盛 on 2017/12/27.
//  Copyright © 2017年 linsheng. All rights reserved.
//

import UIKit
import UITableView_FDTemplateLayoutCell
class TodoTestViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{
    
    let tableView = UITableView(frame: CGRect.zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.frame = self.view.bounds
        tableView.delegate = self
        tableView.dataSource = self;
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "todoCell")
        tableView.estimatedRowHeight = 100
        self.view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TodoTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "todoCell") as? TodoTableViewCell
        
        cell!.setWithModel(index: indexPath.row)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.fd_heightForCell(withIdentifier: "todoCell", cacheBy: indexPath, configuration: { (cell: Any?) in
            let cellTodo = cell as? TodoTableViewCell
            
            cellTodo!.setWithModel(index: indexPath.row)
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
