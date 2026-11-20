package com.moffatbay.bean;

import java.io.Serializable;

public class Room implements Serializable {

    private int roomId;
    private String roomNumber;

    private int roomTypeId;
    private String roomTypeName;

    private int roomStatusId;

    private String viewType;
    private String description;

    private double pricePerNight;

    private int maxGuests;

    private String imageUrl;

    public Room() {

    }

    // =========================
    // Room ID
    // =========================

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    // =========================
    // Room Number
    // =========================

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    // =========================
    // Room Type ID
    // =========================

    public int getRoomTypeId() {
        return roomTypeId;
    }

    public void setRoomTypeId(int roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    // =========================
    // Room Type Name
    // =========================

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
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
    // View Type
    // =========================

    public String getViewType() {
        return viewType;
    }

    public void setViewType(String viewType) {
        this.viewType = viewType;
    }

    // =========================
    // Description
    // =========================

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    // =========================
    // Price Per Night
    // =========================

    public double getPricePerNight() {
        return pricePerNight;
    }

    public void setPricePerNight(double pricePerNight) {
        this.pricePerNight = pricePerNight;
    }

    // =========================
    // Maximum Guests
    // =========================

    public int getMaxGuests() {
        return maxGuests;
    }

    public void setMaxGuests(int maxGuests) {
        this.maxGuests = maxGuests;
    }

    // =========================
    // Image URL
    // =========================

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    // =========================
    // toString()
    // =========================

    @Override
    public String toString() {
        return "Room{" +
                "roomId=" + roomId +
                ", roomNumber='" + roomNumber + '\'' +
                ", roomTypeId=" + roomTypeId +
                ", roomTypeName='" + roomTypeName + '\'' +
                ", roomStatusId=" + roomStatusId +
                ", viewType='" + viewType + '\'' +
                ", description='" + description + '\'' +
                ", pricePerNight=" + pricePerNight +
                ", maxGuests=" + maxGuests +
                ", imageUrl='" + imageUrl + '\'' +
                '}';
    }
}