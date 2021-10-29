package repositories.impl;

import bean.User;
import repositories.UserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {
    @Override
    public void insertUser(User user) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("INSERT INTO demo1.users (name,email,country) VALUE (?, ?, ?);");
                preparedStatement.setString(1, user.getName());
                preparedStatement.setString(2, user.getEmail());
                preparedStatement.setString(3, user.getCountry());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public User selectUser(int id) {
        Connection connection = DBConnection.getConnection();
        User user = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {
            preparedStatement = connection.prepareStatement("SELECT * FROM demo1.users WHERE id=?");
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setName(rs.getString("email"));
                user.setCountry(rs.getString("country"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        Connection connection = DBConnection.getConnection();
        List<User> users = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("SELECT * FROM demo1.users");
                rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String country = rs.getString("country");
                    users.add(new User(id, name, email, country));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    rs.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return users;
    }

    @Override
    public void deleteUser(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("DELETE FROM demo1.users WHERE id = ?;");
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public void updateUser(User user) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("\"UPDATE demo1.users" +
                        " set name = ?,email= ?, country =? WHERE id = ?;\"");
                preparedStatement.setString(1, user.getName());
                preparedStatement.setString(2, user.getEmail());
                preparedStatement.setString(3, user.getCountry());
                preparedStatement.setInt(4, user.getId());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public User getUserById(int id) {
        Connection connection = DBConnection.getConnection();
        User user = null;
        CallableStatement callableStatement = null;
        if (connection != null) {
            try {
                callableStatement = connection.prepareCall("{CALL get_user_by_id(?)}");
                callableStatement.setInt(1, id);
                ResultSet rs = callableStatement.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String country = rs.getString("country");
                    user = new User(id, name, email, country);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    callableStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return user;
    }

    @Override
    public void insertUserStore(User user) {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        if (connection != null) {
            try {
                callableStatement = connection.prepareCall("{CALL insert_user(?,?,?)}");
                callableStatement.setString(1, user.getName());
                callableStatement.setString(2, user.getEmail());
                callableStatement.setString(3, user.getCountry());
                callableStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    callableStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
