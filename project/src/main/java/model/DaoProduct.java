package model;

import databaseConnection.DatabaseConnection;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoProduct implements Dao<Product> {

    private static DaoProduct instance = null;

    public String currentCategory = "";


    public static DaoProduct getInstance() {
        if (instance == null)
            instance = new DaoProduct();
        return instance;
    }

    private DaoProduct() {

    }

    private ArrayList<Product> list = new ArrayList<Product>();

    Connection connect = DatabaseConnection.getConnection();

    public Product getProductById(String id) {
        List<Product> re = new ArrayList<Product>();
        try {
            Statement s = connect.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM product");
            while (rs.next()) {
                String r1 = rs.getString(1);
                String r2 = rs.getString(2);
                String r3 = rs.getString(3);
                String r4 = rs.getString(4);
                String r5 = rs.getString(5);
                String r6 = rs.getString(6);
                String r7 = rs.getString(7);
                String r8 = rs.getString(8);
                String r9 = rs.getString(9);
                String r10 = rs.getString(10);
                String r11 = rs.getString(11);

               Product product = new Product(r1, r2, r3, r4, Double.parseDouble(r5), Double.parseDouble(r6), Double.parseDouble(r7), Integer.parseInt(r8), Integer.parseInt(r9), Integer.parseInt(r10), r11);
                if (r1.equals(id)) {
                    return product;
                }
            }
        } catch (SQLException e) {
            System.out.println(1236787624);
        }
        return null;
    }

    public List<Product> getProductByCategory(String attrProduct, String category,int pagination) {
        List<Product> re = new ArrayList<Product>();
        try {
            String sql = "";
            if(attrProduct.equals("description"))
                sql = "SELECT * FROM product WHERE description = ? LIMIT ?, ?";
            else if(attrProduct.equals("brand"))
                sql = "SELECT * FROM product WHERE brand = ? LIMIT ?, ?";
            else if(attrProduct.equals("name"))
                sql = "SELECT * FROM product WHERE name = ? LIMIT ?, ?";

            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, category);
            s.setInt(2,(pagination-1) * 9);
            s.setInt(3, 9);

            ResultSet rs = s.executeQuery();

            while (rs.next()) {
                String r1 = rs.getString(1);
                String r2 = rs.getString(2);
                String r3 = rs.getString(3);
                String r4 = rs.getString(4);
                String r5 = rs.getString(5);
                String r6 = rs.getString(6);
                String r7 = rs.getString(7);
                String r8 = rs.getString(8);
                String r9 = rs.getString(9);
                String r10 = rs.getString(10);
                String r11 = rs.getString(11);

                Product product = new Product(r1, r2, r3, r4, Double.parseDouble(r5), Double.parseDouble(r6), Double.parseDouble(r7), Integer.parseInt(r8), Integer.parseInt(r9), Integer.parseInt(r10), r11);
                re.add(product);
            }
        } catch (SQLException e) {
            System.out.println(1236787624);
        }
        return re;
    }
    @Override
    public ArrayList<Product> getAll() {
        try {
            Statement s = connect.createStatement();
            ResultSet rs = s.executeQuery("SELECT * FROM runningman");
            while (rs.next()) {
                String r1 = rs.getString(1);
                String r2 = rs.getString(2);
                String r3 = rs.getString(3);
                String r4 = rs.getString(4);
                String r5 = rs.getString(5);
                String r6 = rs.getString(6);
                String r7 = rs.getString(7);
                String r8 = rs.getString(8);
                String r9 = rs.getString(9);
                String r10 = rs.getString(10);
                String r11 = rs.getString(11);

                Product product = new Product(r1, r2, r3, r4, Double.parseDouble(r5), Double.parseDouble(r6), Double.parseDouble(r7), Integer.parseInt(r8), Integer.parseInt(r9), Integer.parseInt(r10), r11);
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Product> getFilterList(HttpServletRequest request) {
        String[] filterByIconSearch = request.getParameterValues("filterByIconSearch");
        ArrayList<Product> listFilter = null;
        if (filterByIconSearch != null) {
            listFilter = getFilterListByIconSearch(filterByIconSearch[0]);
        }
        else
            listFilter = getFilterListByPanel(request);

        return listFilter;
    }

    public ArrayList<Product> getFilterListByIconSearch(String filterByIconSearch) {
        ArrayList<Product> listFilter = new ArrayList<Product>();
        try {
            String sql = "SELECT * FROM product WHERE name LIKE ?";
            PreparedStatement p = connect.prepareStatement(sql);
            p.setString(1, "%"+filterByIconSearch+"%");
            ResultSet rs = p.executeQuery();
            while (rs.next()) {
                String r1 = rs.getString(1);
                String r2 = rs.getString(2);
                String r3 = rs.getString(3);
                String r4 = rs.getString(4);
                String r5 = rs.getString(5);
                String r6 = rs.getString(6);
                String r7 = rs.getString(7);
                String r8 = rs.getString(8);
                String r9 = rs.getString(9);
                String r10 = rs.getString(10);
                String r11 = rs.getString(11);
                Product product = new Product(r1, r2, r3, r4, Double.parseDouble(r5), Double.parseDouble(r6), Double.parseDouble(r7), Integer.parseInt(r8), Integer.parseInt(r9), Integer.parseInt(r10), r11);
                listFilter.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listFilter;
    }

    public ArrayList<Product> getFilterListByPanel(HttpServletRequest request) {
        ArrayList<Product> listFilter = new ArrayList<Product>();
        try {
            String brands = this.filterBrand(request.getParameterValues("filterBrand"));
            String rates = this.filterRate(request.getParameterValues("filter-star-rate"));
            String orderPrice = this.filterOrderPrice(request.getParameterValues("price-search-radio"));
            String rangePrice = this.filterRangePrice(request.getParameterValues("price-range"));
            String inputPrice = "";
            try {
                inputPrice = this.filterInputPrice(request.getParameterValues("input-range-filter-price"));
            } catch (NumberFormatException e) {
                request.setAttribute("errorInputPrice", e.getMessage());
                return null;
            }
            catch (ArithmeticException e) {
                request.setAttribute("errorInputPrice", e.getMessage());
                return null;
            }

            String sql = "SELECT * FROM product WHERE description=\""+DaoProduct.getInstance().currentCategory+"\" && ";

            if (!brands.isEmpty())
                sql += brands + " && ";
            if (!rates.isEmpty())
                sql += rates + " && ";
            if (!rangePrice.isEmpty())
                sql += rangePrice + " && ";
            if (!inputPrice.isEmpty())
                sql += inputPrice + " && ";

            sql = sql.substring(0, sql.length() - 4); // to remove &&

            if (!orderPrice.isEmpty())
                sql += " " + orderPrice;
            sql += " LIMIT ?, ?";

            PreparedStatement s = connect.prepareStatement(sql);
            int pagination = (int) request.getAttribute("pagination");
            s.setInt(1,(pagination-1) * 9);
            s.setInt(2, 9);

            System.out.println(sql);

            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                String r1 = rs.getString(1);
                String r2 = rs.getString(2);
                String r3 = rs.getString(3);
                String r4 = rs.getString(4);
                String r5 = rs.getString(5);
                String r6 = rs.getString(6);
                String r7 = rs.getString(7);
                String r8 = rs.getString(8);
                String r9 = rs.getString(9);
                String r10 = rs.getString(10);
                String r11 = rs.getString(11);
                Product product = new Product(r1, r2, r3, r4, Double.parseDouble(r5), Double.parseDouble(r6), Double.parseDouble(r7), Integer.parseInt(r8), Integer.parseInt(r9), Integer.parseInt(r10), r11);
                listFilter.add(product);
            }
        } catch (SQLException e) {
            System.out.println(123456789);
            e.printStackTrace();
        }
        return listFilter;
    }



    public String filterBrand(String[] strs) {
        String re = "";
        if (strs != null) {
            re += "";
            for (String str : strs) {
                re += "brand = \"" + str + "\" || ";
            }
            re = re.substring(0, re.length() - 4);
            re += "";
        }
        return re;
    }

    public String filterRate(String[] strs) {
        String re = "";
        if (strs != null) {
            re += "(";
            for (String str : strs) {
                re += "starRate = \"" + str + "\" || ";
            }
            re = re.substring(0, re.length() - 4);
            re += ")";
        }
        return re;
    }

    public String filterRangePrice(String[] strs) {
        String re = "";
        if (strs != null) {
            re += "(";
            for (String str : strs) {
                if (str.equals("Under 50$"))
                    re += "salePrice < 50";
                else if (str.equals("From 50$ to 150$"))
                    re += "salePrice BETWEEN 50 AND 150";
                else
                    re += "salePrice > 150";
                re += " || ";
            }
            re = re.substring(0, re.length() - 4);
            re += ")";
        }
        return re;
    }

    public String filterInputPrice(String[] strs) throws NumberFormatException, ArithmeticException {
        String re = "";
        if (!strs[0].isEmpty() || !strs[1].isEmpty()) {
            double from = 0;
            double to = 0;
            re += "(";
            try {
                from = Double.parseDouble(strs[0]);
            } catch(NumberFormatException e) {
                throw new NumberFormatException("From is not a number");
            }
            try {
                to = Double.parseDouble(strs[1]);
            }  catch(NumberFormatException e) {
                throw new NumberFormatException("To is not a number");
            }
            from = Math.ceil(from * 100) / 100;
            to = Math.ceil(to * 100) / 100;

            if (from >= to) {
                throw new ArithmeticException("from >= to");
            }

            if (from < 1) {
                throw new ArithmeticException("from < 1");
            }

            if (to < 1) {
                throw new ArithmeticException("to < 1");
            }
            re += "salePrice > " + from + " && salePrice < " + to;
            re += ")";
        }
        return re;
    }

    public String filterOrderPrice(String[] strs) {
        String re = "";
        if (strs != null) {
            String str = strs[0];
            if (str.equals("highest-price")) {
                re += "ORDER BY salePrice DESC";
            } else {
                re += "ORDER BY salePrice ASC";
            }
        }
        return re;
    }

    public List<Product> getProductByBrandOnNavigation(String brandOnNavigation) {
        ArrayList<Product> listFilter = new ArrayList<Product>();
        try {
            String sql = "SELECT * FROM product WHERE brand=?";
            PreparedStatement p = connect.prepareStatement(sql);
            p.setString(1, brandOnNavigation);
            ResultSet rs = p.executeQuery();
            while (rs.next()) {
                String r1 = rs.getString(1);
                String r2 = rs.getString(2);
                String r3 = rs.getString(3);
                String r4 = rs.getString(4);
                String r5 = rs.getString(5);
                String r6 = rs.getString(6);
                String r7 = rs.getString(7);
                String r8 = rs.getString(8);
                String r9 = rs.getString(9);
                String r10 = rs.getString(10);
                String r11 = rs.getString(11);
                Product product = new Product(r1, r2, r3, r4, Double.parseDouble(r5), Double.parseDouble(r6), Double.parseDouble(r7), Integer.parseInt(r8), Integer.parseInt(r9), Integer.parseInt(r10), r11);
                listFilter.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listFilter;
    }

    public int getTotalNumberProduct(String attrProduct, String key) {
        int re = 0;
        try {
            String sql = "";
            if(attrProduct.equals("description"))
                sql = "SELECT COUNT(id) FROM product WHERE description = ?";
            else if(attrProduct.equals("brand"))
                sql = "SELECT COUNT(id) FROM product WHERE brand = ?";
            else if(attrProduct.equals("name"))
                sql = "SELECT COUNT(id) FROM product WHERE name = ?";

            PreparedStatement s = connect.prepareStatement(sql);
            s.setString(1, key);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                re = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(1236787624);
        }

        return re;
    }
}