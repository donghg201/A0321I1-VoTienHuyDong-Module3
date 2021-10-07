import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", value = "/DiscountServlet")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a = request.getParameter("product_description");
        String b = request.getParameter("price");
        String c = request.getParameter("percent");

        double discount_amount = Integer.parseInt(b) * Integer.parseInt(c) * 0.01;
        double discount_price = Integer.parseInt(b) - discount_amount;

        request.setAttribute("product_description", a);
        request.setAttribute("discount_amount", discount_amount);
        request.setAttribute("discount_price", discount_price);
        request.getRequestDispatcher("result_final.jsp").forward(request, response);
    }
}
