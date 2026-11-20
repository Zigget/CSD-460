package com.moffatbay.util;

import com.moffatbay.dao.RoomDAO;
import com.moffatbay.bean.Room;

import java.util.List;

public class RoomDAOTest {

    public static void main(String[] args) {

        try {

            RoomDAO dao =
                    new RoomDAO();

            List<Room> rooms =
                    dao.getAllRooms();

            System.out.println(
                    "Rooms Found: "
                    + rooms.size());

            for (Room room : rooms) {

                System.out.println(
                        room.getRoomId()
                        + " - "
                        + room.getRoomTypeName());
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}