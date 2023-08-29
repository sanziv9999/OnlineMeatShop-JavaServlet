package com.example.web;

import Model.CartItems;
import Model.College;
import Model.Product;
import PasswordHashing.PasswordHashing;
import Service.UserService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.*;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
@MultipartConfig
@WebServlet(name = "user", urlPatterns = "/user")

public class HelloServlet extends HttpServlet {

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String page = req.getParameter("page");


        if(page.equalsIgnoreCase("newRegister")){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("newRegister.jsp");
            requestDispatcher.forward(req, resp);

        }


        if(page.equalsIgnoreCase("newLogin")){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("newLogin.jsp");
            requestDispatcher.forward(req, resp);

        }


        if(page.equalsIgnoreCase("newUsers")){

            College college = new College();

            college.setUserName(req.getParameter("userName"));
            college.setPassword(PasswordHashing.hashPassword(req.getParameter("password")));
            college.setPhoneNo((req.getParameter("phoneNo")));
            college.setEmail(req.getParameter("email"));
            college.setAddress(req.getParameter("address"));
            college.setFavTeacher(req.getParameter("favTeacher"));
            college.setFirstMovie(req.getParameter("firstMovie"));


            new UserService().insertUser(college);

            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("message", "Registration Successful !!");

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("newRegister.jsp");
            requestDispatcher.forward(req, resp);

            return;


        }



        if(page.equalsIgnoreCase("register")){
            RequestDispatcher requestDispatcher  = req.getRequestDispatcher("register.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("index")){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(req, resp);

        }
        if(page.equalsIgnoreCase("newHome")){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("newHome.jsp");
            requestDispatcher.forward(req, resp);

        }
        if(page.equalsIgnoreCase("newReview")){
            College college= new College();
            List<College> reviewList = new UserService().getReview();
            req.setAttribute("college", college);
            req.setAttribute("reviewList", reviewList);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("review.jsp");
            requestDispatcher.forward(req, resp);

        }
        if(page.equalsIgnoreCase("newProduct")){
            Product product= new Product();

            List<Product> productList = new UserService().getProductList();
            req.setAttribute("product", product);
            req.setAttribute("productList", productList);

            List<Product> categoryList = new UserService().getCategoryList();
            req.setAttribute("product", product);
            req.setAttribute("categoryList", categoryList);




//            RequestDispatcher requestDispatcher = req.getRequestDispatcher("newProduct.jsp");
             RequestDispatcher requestDispatcher = req.getRequestDispatcher("AddToCartHiddenForm.jsp");

            requestDispatcher.forward(req, resp);

        }
        if(page.equalsIgnoreCase("newFeedback")){

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("newFeedback.jsp");
            requestDispatcher.forward(req, resp);

        }

        if(page.equalsIgnoreCase("newFeedbackForm")){

            College college = new College();
            college.setUserName(req.getParameter("userName"));
            college.setEmail(req.getParameter("email"));
            college.setMessage(req.getParameter("message"));

            new UserService().insertFeedback(college);

            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("message", "Feedback successfully sent !!");
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("newFeedback.jsp");
            requestDispatcher.forward(req, resp);


        }

        if(page.equalsIgnoreCase("newAbout")){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("newAbout.jsp");
            requestDispatcher.forward(req, resp);

        }
        if(page.equalsIgnoreCase("forgetPassword")){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("resetPassword.jsp");
            requestDispatcher.forward(req, resp);
        }
        if(page.equalsIgnoreCase("passwordReset")){
            HttpSession httpSession = req.getSession();
            String email= req.getParameter("email");
            String favTeacher = req.getParameter("favTeacher");
            String firstMovie = req.getParameter("firstMovie");
            httpSession.setAttribute("email", email);

            College college = new UserService().resetPassword(email, favTeacher, firstMovie, req.getSession());

            if (college!=null){

                RequestDispatcher requestDispatcher = req.getRequestDispatcher("newPassword.jsp");
                requestDispatcher.forward(req, resp);
            }
            else {
                httpSession.setAttribute("message", "Your input doesn't match. Please retry.");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("resetPassword.jsp");
                requestDispatcher.forward(req, resp);
            }
        }

        if(page.equalsIgnoreCase("newPassword")){
            HttpSession httpSession = req.getSession();
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("newPassword.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("changePassword")){
            String email = req.getParameter("email");
            College college = new College();
            college.setPassword(PasswordHashing.hashPassword(req.getParameter("password")));

            try {
                new UserService().newPassword(email, college);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("newLogin.jsp");
                requestDispatcher.forward(req, resp);

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }


        }


        if(page.equalsIgnoreCase("login")){

            String userName=req.getParameter("userName");
            String password=PasswordHashing.hashPassword(req.getParameter("password"));


            College college = new UserService().loginUser(userName, password, req.getSession());

            HttpSession httpSession = req.getSession();


            if (college != null)
            {
                String role = college.getRole();
                String email = college.getEmail();
                httpSession.setAttribute("userName", userName);
                httpSession.setAttribute("role", role);
                httpSession.setAttribute("email", email);

                if(role.equalsIgnoreCase("admin")){
                    int userCount = new UserService().countUsers();
                    req.setAttribute("userCount", userCount);

                    int productCount = new UserService().countProducts();
                    req.setAttribute("productCount",productCount);

                    int categoryCount = new UserService().countCategories();
                    req.setAttribute("categoryCount",categoryCount);

                    Product product= new Product();
                    List<Product> categoryList = new UserService().getCategoryList();
                    req.setAttribute("product", product);
                    req.setAttribute("categoryList", categoryList);


                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("newAdminDash.jsp");
                    requestDispatcher.forward(req, resp);
                }
                else {

                    Product product = new Product();
                    List<Product> cartList = new UserService().getCartList();
                    req.setAttribute("product", product);
                    req.setAttribute("cartList", cartList);

                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("newHome.jsp");
                    requestDispatcher.forward(req, resp);
                }
            }
            else {

                httpSession.setAttribute("message", "Invalid Details !! Try with another one");
//                httpSession.removeAttribute("userName");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("newLogin.jsp");
                requestDispatcher.forward(req, resp);
                }
            }

        if(page.equalsIgnoreCase("newAdminDash")){
            int userCount = new UserService().countUsers();
            req.setAttribute("userCount", userCount);

            int productCount = new UserService().countProducts();
            req.setAttribute("productCount",productCount);

            int categoryCount = new UserService().countCategories();
            req.setAttribute("categoryCount",categoryCount);

            Product product= new Product();
            List<Product> categoryList = new UserService().getCategoryList();
            req.setAttribute("product", product);
            req.setAttribute("categoryList", categoryList);


            RequestDispatcher requestDispatcher = req.getRequestDispatcher("newAdminDash.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("category")){
            int category = Integer.parseInt(req.getParameter("categoryId"));
            List<Product> productList = new UserService().getByCatId(category);
            req.setAttribute("productList", productList);
            Product product= new Product();

            List<Product> categoryList = new UserService().getCategoryList();
            req.setAttribute("product", product);
            req.setAttribute("categoryList", categoryList);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("productByCategory.jsp");
            requestDispatcher.forward(req, resp);

        }

        if(page.equalsIgnoreCase("userList")){
            College college= new College();
            int pageNumber = req.getParameter("pageNumber") == null ? 1 : Integer.parseInt(req.getParameter("pageNumber"));
            int rowsPerPage = req.getParameter("rowsPerPage") == null ? 5 : Integer.parseInt(req.getParameter("rowsPerPage"));

            List<College> collegeList = new UserService().getUserList(pageNumber, rowsPerPage);

            req.setAttribute("college", college);
            req.setAttribute("collegeList", collegeList);
            req.setAttribute("pageNumber", pageNumber);
            req.setAttribute("rowsPerPage", rowsPerPage);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("userList.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("userSearch")){
            String search = req.getParameter("searchInput");
            College college=new College();
            List<College> collegeList=new UserService().getUserList(search);

            req.setAttribute("college", college);
            req.setAttribute("collegeList", collegeList);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("userList.jsp");
            requestDispatcher.forward(req, resp);
        }
        if(page.equalsIgnoreCase("categoryList")){
            Product product= new Product();
            List<Product> categoryList = new UserService().getCategoryList();
            req.setAttribute("product", product);
            req.setAttribute("categoryList", categoryList);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("categoryList.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("UserDetails")){

            int id = Integer.parseInt(req.getParameter("id"));
            College college = new UserService().getRow(id);
            req.setAttribute("college", college);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("Details.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("categoryDetails")){

            int categoryId = Integer.parseInt(req.getParameter("categoryId"));
            Product product = new UserService().getCategoryRow(categoryId);
            req.setAttribute("product", product);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("categoryDetails.jsp");
            requestDispatcher.forward(req, resp);
        }
        if(page.equalsIgnoreCase("deleteCategory")){
            int categoryId = Integer.parseInt(req.getParameter("categoryId"));
            Product product = new UserService().deleteCategory(categoryId);
            List<Product> categoryList = new UserService().getCategoryList();
            req.setAttribute("categoryList", categoryList);
            req.setAttribute("product",product);


            RequestDispatcher requestDispatcher = req.getRequestDispatcher("categoryList.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("editCategory")){
            int categoryId = Integer.parseInt(req.getParameter("categoryId"));

            Product product = new UserService().getCategoryRow(categoryId);
            req.setAttribute("product", product);
            req.setAttribute("categoryId", categoryId);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("editCategory.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("categoryEdit")){
            Product product = new Product();
            int categoryId = Integer.parseInt(req.getParameter("categoryId"));
            product.setCategoryTitle(req.getParameter("categoryTitle"));
            product.setCategoryDescription(req.getParameter("categoryDescription"));

            try {
                new UserService().editCategory(categoryId, product);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            List<Product> categoryList = new UserService().getCategoryList();
            req.setAttribute("categoryList", categoryList);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("categoryList.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("deleteUser")){
            int id = Integer.parseInt(req.getParameter("id"));
            College college = new UserService().deleteUser(id);
            int pageNumber = req.getParameter("pageNumber") == null ? 1 : Integer.parseInt(req.getParameter("pageNumber"));
            int rowsPerPage = req.getParameter("rowsPerPage") == null ? 5 : Integer.parseInt(req.getParameter("rowsPerPage"));

            List<College> collegeList = new UserService().getUserList(pageNumber, rowsPerPage);
            req.setAttribute("college", college);
            req.setAttribute("collegeList", collegeList);
            req.setAttribute("pageNumber", pageNumber);
            req.setAttribute("rowsPerPage", rowsPerPage);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("userList.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("deleteProduct")){
            int id = Integer.parseInt(req.getParameter("id"));
            Product product = new UserService().deleteProduct(id);


            List<Product> productList = new UserService().getProductList();
            req.setAttribute("product", product);
            req.setAttribute("productList", productList);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("productList.jsp");
            requestDispatcher.forward(req, resp);
        }
        if(page.equalsIgnoreCase("editProduct")){
            int id = Integer.parseInt(req.getParameter("id"));

            Product product = new UserService().getProductRow(id);
            req.setAttribute("product", product);
            req.setAttribute("id", id);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("editProduct.jsp");
            requestDispatcher.forward(req, resp);
        }
        if(page.equalsIgnoreCase("productEdit")){
            Product product = new Product();
            int id = Integer.parseInt(req.getParameter("id"));
            product.setName(req.getParameter("name"));
            product.setDescription(req.getParameter("description"));
            product.setPrice(Integer.parseInt(req.getParameter("price")));
            product.setDiscount(Integer.parseInt(req.getParameter("discount")));
            product.setQuantity(Integer.parseInt(req.getParameter("quantity")));
            product.setCategory(Integer.parseInt(req.getParameter("category")));
            product.setImage(req.getParameter("image"));

            try {
                new UserService().editProduct(id, product);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            List<Product> productList = new UserService().getProductList();
            req.setAttribute("product", product);
            req.setAttribute("productList", productList);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("productList.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("productDetails")){

            int id = Integer.parseInt(req.getParameter("id"));
            Product product = new UserService().getProductRow(id);
            req.setAttribute("product", product);
            req.setAttribute("id", id);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("productDetails.jsp");
            requestDispatcher.forward(req, resp);
        }
        if(page.equalsIgnoreCase("editUser")){
            int id = Integer.parseInt(req.getParameter("id"));
            College college = new UserService().getRow(id);
            req.setAttribute("college", college);
            req.setAttribute("id", id);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("editUser.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("userEdit")){
            int id = Integer.parseInt(req.getParameter("id"));

            College college = new College();
            college.setUserName(req.getParameter("userName"));
            college.setPassword(PasswordHashing.hashPassword(req.getParameter("password")));
            college.setPhoneNo(req.getParameter("phoneNo"));
            college.setEmail(req.getParameter("email"));
            college.setAddress(req.getParameter("address"));
            try {
                new UserService().editUser(id, college);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            int pageNumber = req.getParameter("pageNumber") == null ? 1 : Integer.parseInt(req.getParameter("pageNumber"));
            int rowsPerPage = req.getParameter("rowsPerPage") == null ? 5 : Integer.parseInt(req.getParameter("rowsPerPage"));

            List<College> collegeList = new UserService().getUserList(pageNumber, rowsPerPage);
            req.setAttribute("collegeList", collegeList);
            req.setAttribute("pageNumber", pageNumber);
            req.setAttribute("rowsPerPage", rowsPerPage);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("userList.jsp");
            requestDispatcher.forward(req, resp);
        }
        if(page.equalsIgnoreCase("logout")){


            HttpSession session = req.getSession(false);
            if(session != null){
                session.invalidate();
            }
            resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            resp.setHeader("Pragma", "no-cache");
            resp.setHeader("Expires", "0");
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("newHome.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("addUser")){

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("addUser.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("userAdd")){
            College college = new College();

            college.setUserName(req.getParameter("userName"));
            college.setPassword(PasswordHashing.hashPassword(req.getParameter("password")));
            college.setPhoneNo(req.getParameter("phoneNo"));
            college.setEmail(req.getParameter("email"));
            college.setAddress(req.getParameter("address"));

            new UserService().insertUser(college);
            int pageNumber = req.getParameter("pageNumber") == null ? 1 : Integer.parseInt(req.getParameter("pageNumber"));
            int rowsPerPage = req.getParameter("rowsPerPage") == null ? 5 : Integer.parseInt(req.getParameter("rowsPerPage"));

            List<College> collegeList = new UserService().getUserList(pageNumber, rowsPerPage);
            req.setAttribute("collegeList", collegeList);
            req.setAttribute("pageNumber", pageNumber);
            req.setAttribute("rowsPerPage", rowsPerPage);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("userList.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("newProducts")){
            Product product= new Product();

            product.setName(req.getParameter("name"));
            product.setDescription(req.getParameter("description"));
            product.setPrice(Integer.parseInt(req.getParameter("price")));
            product.setDiscount(Integer.parseInt(req.getParameter("discount")));
            product.setQuantity(Integer.parseInt(req.getParameter("quantity")));
            product.setCategory(Integer.parseInt(req.getParameter("categories")));
            Part part = req.getPart("image");
            String fileName=part.getSubmittedFileName();

            product.setImage(part.getSubmittedFileName());
            String uploadPath="C:/Users/sanzi/IdeaProjects/WEB1-/src/main/webapp/assets/" + fileName;

            try {
                FileOutputStream fileOutputStream = new FileOutputStream(uploadPath);
                InputStream inputStream = part.getInputStream();

                byte[] data = new byte[inputStream.available()];
                inputStream.read(data);
                fileOutputStream.write(data);
                fileOutputStream.close();
            }
            catch (Exception e){
                e.printStackTrace();
            }
            new UserService().insertProduct(product);


            int userCount = new UserService().countUsers();
            req.setAttribute("userCount", userCount);

            int productCount = new UserService().countProducts();
            req.setAttribute("productCount",productCount);

            int categoryCount = new UserService().countCategories();
            req.setAttribute("categoryCount",categoryCount);

            List<Product> categoryList = new UserService().getCategoryList();
            req.setAttribute("product", product);
            req.setAttribute("categoryList", categoryList);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("newAdminDash.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("newCategory")){

            Product product = new Product();


            product.setCategoryTitle(req.getParameter("categoryTitle"));
            product.setCategoryDescription(req.getParameter("categoryDescription"));
            new UserService().insertCategory(product);

            int userCount = new UserService().countUsers();
            req.setAttribute("userCount", userCount);

            int productCount = new UserService().countProducts();
            req.setAttribute("productCount",productCount);

            int categoryCount = new UserService().countCategories();
            req.setAttribute("categoryCount",categoryCount);

            List<Product> categoryList = new UserService().getCategoryList();
            req.setAttribute("product", product);
            req.setAttribute("categoryList", categoryList);


            RequestDispatcher requestDispatcher = req.getRequestDispatcher("newAdminDash.jsp");
            requestDispatcher.forward(req, resp);

        }

        if(page.equalsIgnoreCase("addMeat")){
            Product product= new Product();
            List<Product> categoryList = new UserService().getCategoryList();
            req.setAttribute("product", product);
            req.setAttribute("categoryList", categoryList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("productManagement.jsp");
                requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("productList")){
            Product product= new Product();
            List<Product> productList = new UserService().getProductList();
            req.setAttribute("product", product);
            req.setAttribute("productList", productList);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("productList.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("newCheckout")){

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("newCheckout.jsp");
            requestDispatcher.forward(req, resp);
        }

        if(page.equalsIgnoreCase("order")){
            String userName = req.getParameter("userName");
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("userName", userName);

            String cartJson = req.getParameter("cart");


            resp.sendRedirect("order.jsp");
        }

        if (page.equalsIgnoreCase("addToCartHidden")){

            String userName = req.getParameter("userName");
            String email = req.getParameter("email");
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("userName", userName);
            httpSession.setAttribute("email", email);

            Product product= new Product();

            product.setName(req.getParameter("name"));
            product.setDescription(req.getParameter("description"));
            product.setId(Integer.parseInt(req.getParameter("id")));
            product.setPrice(Double.parseDouble(req.getParameter("price")));
            product.setDiscount(Double.parseDouble(req.getParameter("discount")));
            product.setQuantity(Integer.parseInt(req.getParameter("quantity")));
            product.setImage(req.getParameter("image"));

            try {
                new UserService().insertIntoCart(product, req.getSession());
                httpSession.setAttribute("message", "Item added into cart successfully!!");

                List<Product> productList = new UserService().getProductList();
                req.setAttribute("product", product);
                req.setAttribute("productList", productList);

                List<Product> categoryList = new UserService().getCategoryList();
                req.setAttribute("product", product);
                req.setAttribute("categoryList", categoryList);

                RequestDispatcher requestDispatcher = req.getRequestDispatcher("AddToCartHiddenForm.jsp");
                requestDispatcher.forward(req, resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        if (page.equalsIgnoreCase("cartItems")){

            Product product= new Product();
            List<Product> cartList = new UserService().getCartList();
            req.setAttribute("product", product);
            req.setAttribute("cartList", cartList);

            RequestDispatcher requestDispatcher  = req.getRequestDispatcher("newCartItem.jsp");
            requestDispatcher.forward(req, resp);
        }


        }



    public void destroy() {
    }
}