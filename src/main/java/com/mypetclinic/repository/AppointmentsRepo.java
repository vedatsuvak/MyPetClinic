package com.mypetclinic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mypetclinic.model.Appointments;

@Repository
public interface AppointmentsRepo extends JpaRepository<Appointments, Integer> {
	String query1 = "select appointment from Appointments appointment where appointment.petid = ?1";

	@Query(query1)
	List<Appointments> getAppointmentByPetid(int petid);
}
