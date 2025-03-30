package com.trainreservation.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.trainreservation.model.Train;

public class TrainDAO {

    public List<Train> searchTrains(String fromStation, String toStation, String travelDate) {

        List<Train> trains = new ArrayList<>();

        String query = "SELECT " +
                     "    T.train_no, " +
                     "    T.train_name, " +
                     "    S1.station_name AS from_station, " +
                     "    R1.arrival_time AS departure_time, " +
                     "    S2.station_name AS to_station, " +
                     "    R2.arrival_time AS arrival_time, " +
                     "    S.seats_available, " +
                     "    S.travel_date " +
                     "FROM Trains T " +
                     "JOIN Routes R1 ON T.train_no = R1.train_no " +
                     "JOIN Routes R2 ON T.train_no = R2.train_no " +
                     "JOIN Stations S1 ON R1.station_id = S1.station_id " +
                     "JOIN Stations S2 ON R2.station_id = S2.station_id " +
                     "JOIN Seats S ON T.train_no = S.train_no " +
                     "WHERE S1.station_name = ? " +
                     "AND S2.station_name = ? " +
                     "AND S.travel_date = ? " +
                     "AND R1.arrival_time < R2.arrival_time " +
                     "ORDER BY R1.arrival_time";

        try (Connection con = DBConnection.getConnection(); PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, fromStation);
            pstmt.setString(2, toStation);
            pstmt.setString(3, travelDate);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Train train = new Train();
                    train.setTrainNo(rs.getString("train_no"));
                    train.setTrainName(rs.getString("train_name"));
                    train.setFromStation(rs.getString("from_station"));
                    train.setDepartureTime(rs.getString("departure_time"));
                    train.setToStation(rs.getString("to_station"));
                    train.setArrivalTime(rs.getString("arrival_time"));
                    train.setSeatsAvailable(rs.getInt("seats_available"));
                    train.setTravelDate(rs.getString("travel_date"));
                    trains.add(train);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return trains;
    }

}
