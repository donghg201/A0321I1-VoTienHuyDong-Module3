package repositories;

import bean.User;

import java.sql.SQLException;
import java.util.List;

public interface UserRepository {
    public void insertUser(User user);

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public void deleteUser(int id);

    public void updateUser(User user);

    public User getUserById(int id);

    public void insertUserStore(User user);
}
