package com.spti.dto.treatment;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TreatmentRequest {
	private long admittanceId;
	private String medicineName;
	private String medicineTime;
	private  LocalDate treatmentDate;
	private  int bill;
	private  String billPaid;
	private String paymentMode;
	private String createdBy;

}
