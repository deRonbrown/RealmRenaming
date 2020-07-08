//
//  ViewController.swift
//  RealmRenaming
//
//  Created by DeRon Brown on 7/8/20.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
  
  private static let realmConfig = Realm.Configuration(
    fileURL: Realm.Configuration.defaultConfiguration.fileURL,
    readOnly: false,
    schemaVersion: 1,
    deleteRealmIfMigrationNeeded: false)
  
  private let realm = try? Realm(configuration: realmConfig)

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Generate some Foos
    guard let realm = realm else { return }
    if realm.objects(Foo.self).count == 0 {
      
      try? realm.write {
        for i in (0..<10) {
          let foo = Foo()
          foo.uuid = UUID().uuidString
          foo.title = "Foo\(i)"
          realm.add(foo)
        }
      }
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    guard let realm = realm else { return }
    for foo in realm.objects(Foo.self) {
      print("\(foo.title) (\(foo.uuid))")
    }
  }
}

