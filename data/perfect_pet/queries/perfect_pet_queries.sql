-- PerfectPet benchmark queries (Q1–Q10)

SET search_path TO clean_db, public;

--------------------------------------------------
-- Q1 — No join, high tuples (animals)
--------------------------------------------------
SELECT a.gender, a.name, a.species
FROM clean_db.animal a;

--------------------------------------------------
-- Q2 — No join, low tuples (services)
--------------------------------------------------
SELECT s.id_service, s.service_name
FROM clean_db.service s;

--------------------------------------------------
-- Q3 — Star (appointment–owner–animal): 1–1 joins
--------------------------------------------------
SELECT ap.id_appointment, o.id_owner, a.id_animal, ap.appt_reason
FROM clean_db.appointment ap
JOIN clean_db.owner  o ON o.id_owner  = ap.id_owner
JOIN clean_db.animal a ON a.id_animal = ap.id_animal;

--------------------------------------------------
-- Q4 — Chain (appointment–service): high fan-out
--------------------------------------------------
SELECT ap.id_appointment, aps.id_service, s.service_name
FROM clean_db.appointment ap
JOIN clean_db.appointment_service aps ON aps.id_appointment = ap.id_appointment
JOIN clean_db.service s               ON s.id_service       = aps.id_service;

--------------------------------------------------
-- Q5 — Chain (appointment–slot–doctor): low fan-out
--------------------------------------------------
SELECT ap.id_appointment, sl.id_slot, d.id_doctor, d.first_name
FROM clean_db.appointment ap
JOIN clean_db.appointment_slot apsl ON apsl.id_appointment = ap.id_appointment
JOIN clean_db.slot sl               ON sl.id_slot          = apsl.id_slot
JOIN clean_db.doctor d              ON d.id_doctor         = sl.id_doctor;

--------------------------------------------------
-- Q6 — Chain+Star (owner+animal+service)
--------------------------------------------------
SELECT ap.id_appointment, o.id_owner, a.id_animal, s.id_service
FROM clean_db.appointment ap
JOIN clean_db.owner  o                ON o.id_owner         = ap.id_owner
JOIN clean_db.animal a                ON a.id_animal        = ap.id_animal
JOIN clean_db.appointment_service aps ON aps.id_appointment = ap.id_appointment
JOIN clean_db.service s               ON s.id_service       = aps.id_service;

--------------------------------------------------
-- Q7 — Duplicates stress (service + slot branches)
--------------------------------------------------
SELECT ap.id_appointment, s.id_service, sl.id_slot
FROM clean_db.appointment ap
JOIN clean_db.appointment_service aps ON aps.id_appointment = ap.id_appointment
JOIN clean_db.service s               ON s.id_service       = aps.id_service
JOIN clean_db.appointment_slot apsl   ON apsl.id_appointment = ap.id_appointment
JOIN clean_db.slot sl                 ON sl.id_slot         = apsl.id_slot;

--------------------------------------------------
-- Q8 — Long chain with intersection (historization + booked slots)
--------------------------------------------------
SELECT d.id_doctor
FROM clean_db.doctor d
JOIN clean_db.doctor_historization dh ON dh.id_doctor = d.id_doctor
JOIN clean_db.slot sl                  ON sl.id_doctor = d.id_doctor
JOIN clean_db.appointment_slot apsl    ON apsl.id_slot = sl.id_slot
JOIN clean_db.appointment ap           ON ap.id_appointment = apsl.id_appointment;

--------------------------------------------------
-- Q9 — Wide terminals (chain+star with many columns)
--------------------------------------------------
SELECT
  o.first_name        AS owner_first_name,
  a.name              AS animal_name,
  a.species           AS animal_species,
  ap.id_appointment,
  ap.appt_reason,
  s.service_name      AS service_name,
  d.first_name        AS doctor_first_name,
  sl.date,
  sl.time,
  sl.type
FROM clean_db.appointment ap
JOIN clean_db.owner  o                ON o.id_owner         = ap.id_owner
JOIN clean_db.animal a                ON a.id_animal        = ap.id_animal
JOIN clean_db.appointment_service aps ON aps.id_appointment = ap.id_appointment
JOIN clean_db.service s               ON s.id_service       = aps.id_service
JOIN clean_db.appointment_slot apsl   ON apsl.id_appointment = ap.id_appointment
JOIN clean_db.slot sl                 ON sl.id_slot         = apsl.id_slot
JOIN clean_db.doctor d                ON d.id_doctor        = sl.id_doctor;

--------------------------------------------------
-- Q10 — Owner–Animal via microchip bridge
--------------------------------------------------
SELECT o.id_owner, o.first_name, a.id_animal, a.name, a.species
FROM clean_db.owner o
JOIN clean_db.animal_owner ao ON ao.id_owner    = o.id_owner
JOIN clean_db.animal a        ON a.id_microchip = ao.id_microchip;
