package com.moffatbay.bean;

import java.io.Serializable;

public class RoomStatus implements Serializable {

    private int roomStatusId;
    private String statusName;

    public RoomStatus() {
    }

    public RoomStatus(int roomStatusId, String statusName) {
        this.roomStatusId = roomStatusId;
        this.statusName = statusName;
    }

    // =========================
    // Room Status ID
    // =========================

    public int getRoomStatusId() {
        return roomStatusId;
    }

    public void setRoomStatusId(int roomStatusId) {
        this.roomStatusId = roomStatusId;
    }

    // =========================
    // Status Name
    // =========================

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    // =========================
    // Helper Methods
    // =========================

    public boolean isAvailable() {
        return "Available".equalsIgnoreCase(statusName);
    }

    public boolean isOccupied() {
        return "Occupied".equalsIgnoreCase(statusName);
    }

    public boolean isMaintenance() {
        return "Maintenance".equalsIgnoreCase(statusName);
    }

    public boolean isOutOfService() {
        return "Out of Service".equalsIgnoreCase(statusName);
    }

    // =========================
    // toString()
    // =========================

    @Override
    public String toString() {
        return "RoomStatus{" +
                "roomStatusId=" + roomStatusId +
                ", statusName='" + statusName + '\'' +
                '}';
    }
}