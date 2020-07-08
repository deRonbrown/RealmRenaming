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
    schemaVersion: 2,
    migrationBlock: { migration, oldSchemaVersion in
      if oldSchemaVersion < 2 {
        migration.enumerateObjects(ofType: "Foo") { oldObject, newObject in
          if let oldObject = oldObject {
            // Create Bar from Foo
            migration.create("Bar", value: oldObject)
          }
        }
      }
    },
    deleteRealmIfMigrationNeeded: false)
  
  private let realm = try? Realm(configuration: realmConfig)

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    guard let realm = realm else { return }
    for bar in realm.objects(Bar.self) {
      print("\(bar.title) (\(bar.uuid))")
    }
  }
}

