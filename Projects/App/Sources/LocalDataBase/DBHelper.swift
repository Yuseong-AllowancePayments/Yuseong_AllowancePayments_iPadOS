import Foundation
import SQLite3

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
        var db: OpaquePointer? = nil
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

    func createTable() {
        let query = """
               CREATE TABLE IF NOT EXISTS veteranTable(
               registration_num TEXT PRIMARY KEY,
               name TEXT NOT NULL,
               birth_date TEXT NOT NULL,
               post_address TEXT NOT NULL,
               road_address TEXT NOT NULL,
               administrative_address TEXT,
               phone_num TEXT NOT NULL,
               bank_name TEXT NOT NULL,
               account TEXT NOT NULL,
               account_type TEXT NOT NULL,
               account_owner TEXT NOT NULL,
               application_date TEXT NOT NULL
               );

               CREATE TABLE IF NOT EXISTS spouseTable(
               affairs_num TEXT PRIMARY KEY,
               applicant_name TEXT NOT NULL,
               applicant_sin TEXT NOT NULL,
               applicant_post_address TEXT NOT NULL,
               applicant_road_address TEXT NOT NULL,
               administrative_address TEXT,
               veteran_name TEXT NOT NULL,
               veteran_sin TEXT NOT NULL,
               death_date TEXT NOT NULL,
               war_name TEXT NOT NULL,
               bank_name TEXT NOT NULL,
               account_owner TEXT NOT NULL,
               account TEXT NOT NULL,
               application_date TEXT NOT NULL
               );

               CREATE TABLE IF NOT EXISTS courtesyTable(
               affairs_num TEXT PRIMARY KEY,
               veteran_type TEXT NOT NULL,
               applicant_name TEXT NOT NULL,
               birth_date TEXT NOT NULL,
               gender TEXT NOT NULL,
               post_address TEXT NOT NULL,
               road_address TEXT NOT NULL,
               administrative_address TEXT,
               phone_nnum TEXT NOT NULL
               bank_name TEXT NOT NULL,
               account_owner TEXT NOT NULL,
               account TEXT NOT NULL,
               application_date TEXT NOT NULL
               );
               """
        var statement: OpaquePointer? = nil

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

    func insertIntoVeteran(
        _ registration_num: String,
        _ name: String,
        _ birth_date: String,
        _ post_address: String,
        _ road_address: String,
        _ administrative_address: String,
        _ phone_num: String,
        _ bank_name: String,
        _ account: String,
        _ account_type: String,
        _ account_owner: String,
        _ application_date: String
    ) {
        let query = "INSERT INTO veteranTable VALUES()"
    }

    func dropTable(_ tableName: String) {
        let query = "DROP TABLE \(tableName)"
        var statement: OpaquePointer? = nil

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
