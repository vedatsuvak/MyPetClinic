package com.mypetclinic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mypetclinic.model.Appointments;
import com.mypetclinic.repository.AppointmentsRepo;

@Service
public class AppointmentsService {
	@Autowired
	private AppointmentsRepo repo;

	// Insert an Appointment
	public Appointments register(Appointments appoint) {
		return repo.save(appoint);
	}

	// update Appointment
	public Appointments updateAppointment(Appointments appoint) {
		return repo.save(appoint);
	}

	// update Appointment
	public List<Appointments> getAppointmentByPetid(int petid) {
		return repo.getAppointmentByPetid(petid);
	}

	// Delete Appointment by ID
	public String deleteById(int id) {
		repo.deleteById(id);
		return "Deleted";
	}
}
