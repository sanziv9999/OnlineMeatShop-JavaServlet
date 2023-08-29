package Service;

import DBConnection.DBConnection;
import Model.College;
import Model.Product;

import java.io.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;





public class UserService {







    public void insertIntoCart(Product product, HttpSession session) throws SQLException {
        String query = "INSERT INTO cart (userName, email, name, price, quantity, discount, image, id) VALUES (?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE quantity=quantity+1";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setString(1, String.valueOf(session.getAttribute("userName")));
            preparedStatement.setString(2, String.valueOf(session.getAttribute("email")));

            preparedStatement.setString(3, product.getName());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setInt(5, product.getQuantity());
            preparedStatement.setDouble(6, product.getDiscount());
            preparedStatement.setString(7,product.getImage());
            preparedStatement.setInt(8, product.getId());
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void insertUser(College college) {

        String query = "insert into user(userName, password, phoneNo, email, address, role, favTeacher, firstMovie)" + "values(?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setString(1, college.getUserName());
            preparedStatement.setString(2, college.getPassword());
            preparedStatement.setString(3, college.getPhoneNo());
            preparedStatement.setString(4, college.getEmail());
            preparedStatement.setString(5, college.getAddress());
            preparedStatement.setString(6,"normal");
            preparedStatement.setString(7, college.getFavTeacher());
            preparedStatement.setString(8, college.getFirstMovie());


            preparedStatement.execute();



        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    //Method parameter

    //DELETE USER
    public College deleteUser(int id) {
        String query = "delete from user where id=?";
        PreparedStatement preparedStatement1 = new DBConnection().getStatement(query);

        try {
            preparedStatement1.setInt(1, id);
            preparedStatement1.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //UPDATE USER
    public void editUser(int id, College college) throws SQLException {
        String query = "update user set userName=?, password=? , phoneNo=?, email=?, address=?"+ "where id=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setString(1, college.getUserName());
            preparedStatement.setString(2, college.getPassword());
            preparedStatement.setString(3, college.getPhoneNo());
            preparedStatement.setString(4, college.getEmail());
            preparedStatement.setString(5, college.getAddress());
            preparedStatement.setInt(6, id);
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    //LOGIN
    public College loginUser(String userName, String password, HttpSession session) throws IOException {
        String query = "select * from user where userName=? and password=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        College college = null;

        try {
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                college = new College();
                college.setId(resultSet.getInt("id"));
                college.setUserName(resultSet.getString("userName"));
                college.setPassword(resultSet.getString("password"));
                college.setRole(resultSet.getString("role"));
                college.setEmail(resultSet.getString("email"));

                session.setAttribute("role", college.getRole());
                session.setAttribute("email", college.getEmail());
                session.setAttribute("phoneNo", college.getPhoneNo());
                session.setAttribute("address", college.getAddress());


            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return college;
    }

    public College resetPassword(String email, String favTeacher, String firstMovie, HttpSession httpSession) throws IOException {
        String query = "select * from user where email=? and favTeacher=? or firstMovie=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        College college = null;

        try {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, favTeacher);
            preparedStatement.setString(3, firstMovie);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                college = new College();
                college.setId(resultSet.getInt("id"));
                college.setUserName(resultSet.getString("userName"));
                college.setPassword(resultSet.getString("password"));
                college.setRole(resultSet.getString("role"));
                college.setEmail(resultSet.getString("email"));

                httpSession.setAttribute("email", college.getEmail());

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return college;
    }


    public void newPassword(String email, College college) throws SQLException{
        String query = "update user set password=?" + "where email=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setString(1, college.getPassword());
            preparedStatement.setString(2, email);
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }




    public List<College> getUserList(String search) {
        ArrayList<College> collegeList = new ArrayList<>();
        String query = "SELECT * FROM user WHERE userName LIKE ?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setString(1, "%" + search + "%");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                College college = new College();
                college.setId(resultSet.getInt("id"));
                college.setUserName(resultSet.getString("userName"));
                college.setPassword(resultSet.getString("password"));
                college.setPhoneNo((resultSet.getString("phoneNo")));
                college.setEmail(resultSet.getString("email"));
                college.setAddress(resultSet.getString("address"));

                collegeList.add(college);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return collegeList;
    }

    public List<College> getUserList(int pageNumber, int rowsPerPage){

        int start = (pageNumber - 1) * rowsPerPage;
        ArrayList<College> collegeList = new ArrayList<>();
        String query = "select * from user ORDER BY id LIMIT ?, ?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, rowsPerPage);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                College college = new College();
                college.setId(resultSet.getInt("id"));
                college.setUserName(resultSet.getString("userName"));
                college.setPassword(resultSet.getString("password"));
                college.setPhoneNo(resultSet.getString("phoneNo"));
                college.setEmail(resultSet.getString("email"));
                college.setAddress(resultSet.getString("address"));
                collegeList.add(college);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return collegeList;
    }

    public List<Product> getCartList() {
        ArrayList<Product> cartList = new ArrayList<>();
        String query = "select * from cart";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getDouble("price"));
                product.setQuantity(resultSet.getInt("quantity"));
                product.setDiscount(resultSet.getDouble("discount"));
                product.setImage(resultSet.getString("image"));
                cartList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cartList;
    }


    public List<Product> getCategoryList() {
        List<Product> categoryList = new ArrayList<>();
        String query = "select * from categories";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setCategoryId(resultSet.getInt("categoryId"));
                product.setCategoryTitle(resultSet.getString("categoryTitle"));
                product.setCategoryDescription(resultSet.getString("categoryDescription"));
                categoryList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryList;
    }

    public List<Product> getProductList() {
        List<Product> productList = new ArrayList<>();
        String query = "select * from productdetails";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getInt("price"));
                product.setDiscount(resultSet.getInt("discount"));
                product.setQuantity(resultSet.getInt("quantity"));
                product.setCategory(resultSet.getInt("category"));
                product.setImage(resultSet.getString("image"));
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public List<Product> getByCatId(int category) {
        List<Product> productList = new ArrayList<>();
        String query = "select * from productdetails where category=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setInt(1,category);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getInt("price"));
                product.setDiscount(resultSet.getInt("discount"));
                product.setQuantity(resultSet.getInt("quantity"));
                product.setCategory(resultSet.getInt("category"));
                product.setImage(resultSet.getString("image"));
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public College getRow(int id){
        String query="select * from user where id=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        College college = new College();

        try{
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                college.setId(resultSet.getInt("id"));
                college.setUserName(resultSet.getString("userName"));
                college.setPassword(resultSet.getString("password"));
                college.setPhoneNo(resultSet.getString("phoneNo"));
                college.setEmail(resultSet.getString("email"));
                college.setAddress(resultSet.getString("address"));


            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return college;

    }
    public Product getCategoryRow(int categoryId){
        String query="select * from categories where categoryId=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        Product product = new Product();

        try{
            preparedStatement.setInt(1,categoryId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                product.setCategoryId(resultSet.getInt("categoryId"));
                product.setCategoryTitle(resultSet.getString("categoryTitle"));
                product.setCategoryDescription(resultSet.getString("categoryDescription"));

            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return product;

    }

    public Product getProductRow(int id){
        String query="select * from productdetails where id=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        Product product = new Product();

        try{
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setPrice(resultSet.getInt("price"));
                product.setDiscount(resultSet.getInt("discount"));
                product.setQuantity(resultSet.getInt("quantity"));
                product.setCategory(resultSet.getInt("category"));
                product.setImage(resultSet.getString("image"));



            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return product;

    }

    public void insertFeedback(College college){
        String query= "insert into feedback(userName,email,message)" + "values(?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try{
            preparedStatement.setString(1, college.getUserName());
            preparedStatement.setString(2, college.getEmail());
            preparedStatement.setString(3, college.getMessage());
            preparedStatement.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public List<College> getReview(){
        ArrayList<College> reviewList = new ArrayList<>();
        String query = "select * from feedback";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                College college = new College();
                college.setUserName(resultSet.getString("userName"));
                college.setEmail(resultSet.getString("email"));
                college.setMessage(resultSet.getString("message"));
                reviewList.add(college);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviewList;
    }

    public void insertProduct(Product product){
        String query = "insert into productdetails (name,description, price, discount, quantity, category, image)" + "values(?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDescription());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setDouble(4, product.getDiscount());
            preparedStatement.setInt(5, product.getQuantity());
            preparedStatement.setInt(6, product.getCategory());
            preparedStatement.setString(7, product.getImage());
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Product deleteProduct(int id){
        String query = "delete from productdetails where id=?";
        PreparedStatement preparedStatement1 = new DBConnection().getStatement(query);

        try {
            preparedStatement1.setInt(1, id);
            preparedStatement1.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public void editProduct(int id, Product product) throws SQLException{
        String query = "update productdetails set name=?, description=?,  price=?, discount=?, quantity=?, category=?, image=?" + "where id=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDescription());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setDouble(4, product.getDiscount());
            preparedStatement.setInt(5, product.getQuantity());
            preparedStatement.setInt(6, product.getCategory());
            preparedStatement.setString(7, product.getImage());
            preparedStatement.setInt(8,id);
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void insertCategory(Product product){
        String query = "insert into categories (categoryDescription, categoryTitle)" + "values(?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setString(1, product.getCategoryDescription());
            preparedStatement.setString(2, product.getCategoryTitle());
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Product deleteCategory(int categoryId){
        String query = "delete from categories where categoryId=?";
        PreparedStatement preparedStatement1 = new DBConnection().getStatement(query);

        try {
            preparedStatement1.setInt(1, categoryId);
            preparedStatement1.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public void editCategory(int categoryId, Product product) throws SQLException{
        String query = "update categories set categoryDescription=?, categoryTitle=?" + "where categoryId=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setString(1, product.getCategoryDescription());
            preparedStatement.setString(2, product.getCategoryTitle());
            preparedStatement.setInt(3, categoryId);
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }




    public int countUsers() {
        String query = "select count(*) from user";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public int countProducts() {
        String query = "select count(*) from productdetails";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public int countCategories() {
        String query = "select count(*) from categories";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }








}