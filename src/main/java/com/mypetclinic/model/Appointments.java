package com.mypetclinic.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Appointments {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int appointmentid;
	private String date;
	private String time;
	private int petid;
}
