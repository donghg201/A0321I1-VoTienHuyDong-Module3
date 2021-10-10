import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a = request.getParameter("first_operand");
        String b = request.getParameter("second_operand");
        String opt = request.getParameter("option");

        switch (opt) {
            case "addition":
                int add = Integer.parseInt(a) + Integer.parseInt(b);
                request.setAttribute("resultFromServlet", add);
                break;
            case "subtraction":
                int sub = Integer.parseInt(a) - Integer.parseInt(b);
                request.setAttribute("resultFromServlet", sub);
                break;
            case "multiplication":
                int mul = Integer.parseInt(a) * Integer.parseInt(b);
                request.setAttribute("resultFromServlet", mul);
                break;
            case "division":
                int div = Integer.parseInt(a) / Integer.parseInt(b);
                request.setAttribute("resultFromServlet", div);
                break;
        }

        request.getRequestDispatcher("result_final.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
