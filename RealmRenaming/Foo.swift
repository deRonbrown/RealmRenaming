//
//  Foo.swift
//  RealmRenaming
//
//  Created by DeRon Brown on 7/8/20.
//

import RealmSwift

class Foo : Object {
  @objc dynamic var uuid: String = ""
  @objc dynamic var title: String = ""
  
  override static func primaryKey() -> String? {
    return "uuid"
  }
}
