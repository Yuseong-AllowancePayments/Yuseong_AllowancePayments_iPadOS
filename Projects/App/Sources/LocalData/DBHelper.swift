import Foundation
import SQLite3

// swiftlint:disable identifier_name
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
                    우편번호 TEXT,
               시도 TEXT,
               시도영문 TEXT,
               시군구 TEXT,
               시군구영문 TEXT,
               읍면 TEXT,
               읍면영문 TEXT,
               도로명코드 TEXT,
               도로명 TEXT,
               도로명영문 TEXT,
               지하여부 TEXT,
               건물번호본번 TEXT,
               건물번호부번 TEXT,
               건물관리번호 TEXT,
               다량배달처명 TEXT,
               시군구용건물명 TEXT,
               법정동코드 TEXT,
               법정동명 TEXT,
               리명 TEXT,
               행정동명 TEXT,
               산여부 TEXT,
               지번본번 TEXT,
               읍면동일련번호 TEXT,
               지번부번 TEXT,
               구우편번호 TEXT,
               우편번호일련번호 TEXT
                    serial_num TEXT,
                    name TEXT NOT NULL,
                    birth_date TEXT NOT NULL,
                    sin TEXT NOT NULL,
                    registration_num TEXT PRIMARY KEY,
                    post_address TEXT NOT NULL,
                    road_address TEXT NOT NULL,
                    administrative_address TEXT,
                    phone_num TEXT NOT NULL,
                    account_owner TEXT NOT NULL,
                    bank_name TEXT NOT NULL,
                    account TEXT NOT NULL,
                    move_in_date TEXT NOT NULL,
                    application_date TEXT NOT NULL,
                    application_reason TEXT,
                    note TEXT
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

//    func insertIntoVeteran(
//        _ registrationNum: String,
//        _ name: String,
//        _ birthDate: String,
//        _ postAddress: String,
//        _ roadAddress: String,
//        _ administrativeAddress: String,
//        _ phoneNum: String,
//        _ bankName: String,
//        _ account: String,
//        _ accountType: String,
//        _ accountOwner: String,
//        _ applicationDate: String
//    ) {
//        let query = "INSERT INTO veteranTable VALUES()"
//    }

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
