/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import cart.OrderDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author 84348
 */
public class UserDAO {

    private static final String LOGIN = "SELECT roleID,address,birthday,phone,email FROM tblUsers WHERE userID=? AND password=?";
    private static final String SEARCH = "SELECT productID,productName,image,price,quantity,categoryID,importDate,usingDate,status FROM tblProduct WHERE productName like ?";
    private static final String CREATE_ORDER = "INSERT INTO tblOrder(orderDate, total, userID) VALUES(?,?,?)";
    private static final String GET_ORDER = "SELECT TOP 1 orderID FROM tblOrder wher ORDER BY orderID DESC";
    private static final String CREATE_ORDER_DETAIL = "INSERT INTO tblOrderDetail(price, quantity, orderID, productID) VALUES(?,?,?,?)";
    private static final String CHECKDUPLICATEGOOGLE = "SELECT userID, password, roleID, phone, birthday, address, email "
            + "FROM tblUsers "
            + "WHERE email=? ";
    private static final String CREATE = "INSERT "
            + "INTO tblUsers(userId, password, roleID, address, birthday, phone, email) "
            + "VALUES(?,?,'RS',?,?,?,?)";
    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String roleID = rs.getString("roleID");
                    String address = rs.getString("address");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    user = new UserDTO(userID, "", roleID, address, birthday, phone, email);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return user;
    }

    public List<UserProduct> getListUserProduct(String search) throws SQLException {
        List<UserProduct> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = Double.parseDouble(rs.getString("price"));
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    String importDate = rs.getString("importDate");
                    String usingDate = rs.getString("usingDate");
                    String status = rs.getString("status");
                    if (status.equals("True")) {
                        list.add(new UserProduct(productID, productName, image, price, quantity, categoryID, importDate, usingDate, status));
                    }

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public boolean createOrder(OrderDTO order) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_ORDER);
                ptm.setString(1, order.getOrderDate());
                ptm.setDouble(2, order.getTotal());
                ptm.setString(3, order.getUserID());
                if(ptm.executeUpdate() > 0){
                    check = true;
                }else{
                    check = false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }
    
    public int getOrderId() throws SQLException {
        int orderID = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ORDER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    orderID = Integer.parseInt(rs.getString("orderID"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return orderID;
    }
    
    public boolean createOrderDetail(UserOrderDetail detail) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_ORDER_DETAIL);
                ptm.setDouble(1, detail.getPrice());
                ptm.setDouble(2, detail.getQuantity());
                ptm.setInt(3, detail.getOrderID());
                ptm.setString(4, detail.getProductID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }

        }
        return check;
    }
    
    public UserDTO checkDuplicateGoogle(String mail) throws SQLException {
        UserDTO loginUser = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECKDUPLICATEGOOGLE);
                ptm.setString(1, mail);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String userID = rs.getString("userID");
                    String roleID = rs.getString("roleID");
                    String password = rs.getString("password");
                    String birthday = rs.getString("birthday");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    loginUser = new UserDTO(userID, password, roleID, address, birthday, phone, mail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return loginUser;
    }
    
    public boolean create(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getPassword());
                ptm.setString(3, user.getAddress());
                ptm.setString(4, user.getBirthday());
                ptm.setString(5, user.getPhone());
                ptm.setString(6, user.getEmail());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
