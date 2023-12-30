import Foundation
import SQLite3

// swiftlint:disable identifier_name
struct AdministrativeDistrict: Codable {
    var postCode: String
    var zone: String
}

class DBHelper {
    static let shared = DBHelper()

    var db: OpaquePointer?
    let databaseName = "localDB.sqlite"

    init() {
        self.db = createDB()
    }

    deinit {
        sqlite3_close(db)
    }

    private func createDB() -> OpaquePointer? {
        var db: OpaquePointer?
        do {
            let dbPath: String = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false).appendingPathComponent(databaseName).path

            if sqlite3_open(dbPath, &db) == SQLITE_OK {
                print("Successfully created DB. Path: \(dbPath)")
                return db
            }
        } catch {
            print("Error while creating Database -\(error.localizedDescription)")
        }
        return nil
    }

    func createAdministrationTable() {
        let query = """
               CREATE TABLE IF NOT EXISTS administration(
                    우편번호 TEXT PRIMARY KEY,
                    행정동명 TEXT
               );
               """
        var statement: OpaquePointer?

        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Creating table has been succesfully done. db: \(String(describing: self.db))")
            } else {
                let errorMessage = String(cString: sqlite3_errmsg(db))
                print("\nsqlte3_step failure while creating table: \(errorMessage)")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(self.db))
            print("\nsqlite3_prepare failure while creating table: \(errorMessage)")
        }

        sqlite3_finalize(statement)
    }

    func insertIntoAdministration(
        _ 우편번호: String,
        _ 행정동: String
    ) {
        let query = "INSERT INTO administration (우편번호, 행정동명) VALUES (?, ?)"
        var statement: OpaquePointer?

        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 2, 우편번호, -1, nil)
            sqlite3_bind_text(statement, 3, 행정동, -1, nil)

            if sqlite3_step(statement) == SQLITE_DONE {
                print("insert data success")
            } else {
                print("insert data sqlite3 step fail")
            }

        } else {
            print("insert Data prepare fail")
        }
        sqlite3_finalize(statement)
    }

    func dropTable(_ tableName: String) {
        let query = "DROP TABLE \(tableName)"
        var statement: OpaquePointer?

        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("drop table success")
            } else {
                print("drop table step fail")
            }
        } else {
            print("drop table prepare fail")
        }
    }

    
}
// swiftlint:enable identifier_name
