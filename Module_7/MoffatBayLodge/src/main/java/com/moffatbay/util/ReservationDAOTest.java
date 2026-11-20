package com.moffatbay.util;

import com.moffatbay.bean.Reservation;
import com.moffatbay.dao.ReservationDAO;

import java.time.LocalDate;

public class ReservationDAOTest {

    public static void main(String[] args) {

        try {

            Reservation reservation =
                    new Reservation();

            reservation.setCustomerId(1);

            reservation.setRoomId(1);

            reservation.setStatusId(2);

            reservation.setCheckInDate(
                    LocalDate.now().plusDays(7));

            reservation.setCheckOutDate(
                    LocalDate.now().plusDays(10));

            reservation.setGuestCount(2);

            reservation.setTotalNights(3);

            reservation.setTotalCost(750.00);

            reservation.setSpecialRequests(
                    "Database Test Reservation");

            ReservationDAO dao =
                    new ReservationDAO();

            int reservationId =
                    dao.createReservation(
                            reservation);

            System.out.println(
                    "Reservation Created: "
                    + reservationId);

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}