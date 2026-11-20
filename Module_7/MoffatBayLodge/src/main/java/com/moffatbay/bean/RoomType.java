package com.moffatbay.bean;

import java.io.Serializable;
import java.util.Objects;

public class RoomType implements Serializable {

    private static final long serialVersionUID = 1L;

    private int roomTypeId;
    private String roomTypeName;
    private String description;
    private double pricePerNight;
    private int maxGuests;

    public RoomType() {
    }

    public RoomType(int roomTypeId,
                    String roomTypeName,
                    String description,
                    double pricePerNight,
                    int maxGuests) {

        this.roomTypeId = roomTypeId;
        this.roomTypeName = roomTypeName;
        this.description = description;
        this.pricePerNight = pricePerNight;
        this.maxGuests = maxGuests;
    }

    // Room Type ID

    public int getRoomTypeId() {
        return roomTypeId;
    }

    public void setRoomTypeId(int roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    // Room Type Name

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    // Description

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    // Price Per Night

    public double getPricePerNight() {
        return pricePerNight;
    }

    public void setPricePerNight(double pricePerNight) {
        this.pricePerNight = pricePerNight;
    }

    // Maximum Guests

    public int getMaxGuests() {
        return maxGuests;
    }

    public void setMaxGuests(int maxGuests) {
        this.maxGuests = maxGuests;
    }

    // Convenience Method

    public String getFormattedPrice() {
        return String.format("$%.2f", pricePerNight);
    }

    @Override
    public boolean equals(Object obj) {

        if (this == obj) {
            return true;
        }

        if (!(obj instanceof RoomType)) {
            return false;
        }

        RoomType other = (RoomType) obj;

        return roomTypeId == other.roomTypeId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(roomTypeId);
    }

    @Override
    public String toString() {
        return "RoomType{" +
                "roomTypeId=" + roomTypeId +
                ", roomTypeName='" + roomTypeName + '\'' +
                ", description='" + description + '\'' +
                ", pricePerNight=" + pricePerNight +
                ", maxGuests=" + maxGuests +
                '}';
    }
}