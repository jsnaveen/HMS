package com.hospital.managementsystem

class MigrationController {

def prescriptionHistoryMigrationService

def migratePrescriptions() {
        prescriptionHistoryMigrationService.migrateData()
        render "Migration completed successfully."
    }

}
