package extra;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;

/**
 * C
 */
public class DbConnection {
    public ArrayList<jobdata> NA = new ArrayList<jobdata>();
    private String dbURL = "jdbc:mysql://localhost:3306/job";
    private String username = "root";
    private String password = "";
    private Connection connection;

    public DbConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbURL, username, password);
            if (connection != null) {
                System.out.println("Success");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean insertRegis(String name, String email, String password) {

        boolean check = false;
        System.out.println(" In regis!");
        try {
            String sqlQuery = "INSERT INTO user(name,email,password) VALUES(?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);

            int noOfRowsInserted = preparedStatement.executeUpdate();
            if (noOfRowsInserted > 0) {
                check = true;
                System.out.println(noOfRowsInserted + " rows inserted!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }

    public boolean insertjob(String title, String desc,String type, String city, String time, String date) {
        boolean check = false;
        try {
            String sqlQuery = "INSERT INTO jobs(title,description,type,city,time,date) values(?,?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, desc);
            preparedStatement.setString(3, type);
            preparedStatement.setString(4, city);
            preparedStatement.setString(5, time);
            preparedStatement.setString(6, date);
            int noOfRowsInserted = preparedStatement.executeUpdate();
            if (noOfRowsInserted > 0) {
                check = true;
                System.out.println(noOfRowsInserted + " rows inserted!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }


    public boolean checklogin(String n, String p) {

        ResultSet result;
        boolean a = false;
        try {
            String sqlQuery = "SELECT email,password FROM user where email=? and password=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, n);
            preparedStatement.setString(2, p);

            result = preparedStatement.executeQuery();
            if (result.next()) {
                System.out.println("yesdb");
                return true;
            } else {
                System.out.println("nodb");
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }

    public ArrayList<jobdata> getjob() throws SQLException {
        System.out.println(" disptweet");
        int count = 0;
        jobdata ta;
        String sqlQuery = "select * from jobs order by `jobid` desc ";

        PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);

        ResultSet rs = preparedStatement.executeQuery(sqlQuery);
        while (rs.next()) {
            String n = rs.getString("title");
            String d = rs.getString("description");
            String t = rs.getString("type");
            String t1 = rs.getString("city");
            String t2 = rs.getString("time");
            String da = rs.getString("date");
            ta = new jobdata(n, d, t, t1,t2,da);
            NA.add(count, ta);

            count++;
        }
        for (jobdata s : NA) {


            System.out.println(s.getTitle());
        }
        return NA;
    }




}