package com.moffatbay.bean;

import java.io.Serializable;

public class ReservationStatus implements Serializable {

    private int statusId;
    private String statusName;

    public ReservationStatus() {
    }

    public ReservationStatus(int statusId, String statusName) {
        this.statusId = statusId;
        this.statusName = statusName;
    }

    // =========================
    // Status ID
    // =========================

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
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
    // toString()
    // =========================

    @Override
    public String toString() {
        return "ReservationStatus{" +
                "statusId=" + statusId +
                ", statusName='" + statusName + '\'' +
                '}';
    }
}