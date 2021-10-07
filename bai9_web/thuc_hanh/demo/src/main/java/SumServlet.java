import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SumServlet", urlPatterns = "/SumServlet")
public class SumServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a = request.getParameter("number1");
        String b = request.getParameter("number2");
        int c = Integer.parseInt(a) + Integer.parseInt(b);

//        PrintWriter out = response.getWriter();
//        out.println("<html>");
//        out.println("<body>");
//        out.println("<h2 style='color: red'>" + c + "</h2>");
//        out.println("</body>");
//        out.println("</html>");

        request.setAttribute("resultFromServlet",c);
        request.getRequestDispatcher("result_final.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
