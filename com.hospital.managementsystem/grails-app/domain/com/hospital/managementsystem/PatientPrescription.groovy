package com.hospital.managementsystem

class PatientPrescription {

    String medication
    String prescriptionNo
    Date prescriptionDate
    String therapistName
    String therapistInstructions
    String therapyMode
    Integer status
    Date dateCreated
    Date lastUpdated

    static belongsTo = [patientProfile: PatientProfile]

    static constraints = {
        therapistInstructions nullable : true
        prescriptionNo unique : true
        therapyMode inList: ['DigitalTherapy' , 'HospitalTherapy']
    }
}
