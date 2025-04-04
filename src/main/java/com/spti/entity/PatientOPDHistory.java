package com.spti.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "patients_opd_history")
public class PatientOPDHistory {


  
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;

	@Column(name = "seen_by_doctor")
//	@NotNull(message = "Seen by doctor cannot be null")
	private String seenByDoctor;

	@Column(name = "treatment")
//	@NotNull(message = "Treatment cannot be null")
	//@Size(max = 255, message = "Treatment must be less than 255 characters")
	private String treatment;

	@Column(name = "bill")
//	@NotNull(message = "Bill cannot be null")
	private String bill;


	@Column(name = "pending_amount")
	private String pendingAmount;
  
	@Column(name = "bill_Status")
	private String billStatus;

	@ManyToOne
	@JoinColumn(name = "patient_id")
	private Patient patient;

	@Column(name = "date_of_treatment")
//	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private LocalDateTime dateOfTreatment;

    @Column(name = "treatment_date")
    private LocalDate treatmentDate;

    @Column(name = "payment_type")
    private String paymentType;

    @Column(name = "note")
    private String note;
    

    @ManyToOne(targetEntity = Diagnosis.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "diagnosis_id", referencedColumnName = "id")
    private Diagnosis diagnosis;

  
}
