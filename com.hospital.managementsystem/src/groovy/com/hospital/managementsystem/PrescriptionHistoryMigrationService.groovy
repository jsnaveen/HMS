package com.hospital.managementsystem

//import com.hospital.managementsystem.PatientPrescription
//import com.hospital.managementsystem.PrescriptionHistory

class PrescriptionHistoryMigrationService {

    def migrateData() {
        PatientPrescription.list().each { prescription ->
            PrescriptionHistory.withNewTransaction {
                def history = new PrescriptionHistory(
                    medication: prescription.medication,
                    prescriptionDate: prescription.prescriptionDate,
                    therapistName: prescription.therapistName,
                    therapistInstructions: prescription.therapistInstructions,
                    patientName: prescription.patientName
                )
                history.save(failOnError: true)
            }
        }
    }
}
