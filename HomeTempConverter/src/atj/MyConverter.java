package atj;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyConverter
 */
@WebServlet(description = "General Converte of Celcius/Fahrenheit Temperature", urlPatterns = { "/MyConverter",
		"/MyCustomConvert" }, initParams = {
				@WebInitParam(name = "inputValue", value = "10", description = "Value to convert") })
public class MyConverter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		String pInputValue = request.getParameter("inputValue");
		String pConvertDirection = request.getParameter("convertDirection");
		//
		Double inputValue = Double.valueOf(pInputValue);
		Double outputValue = 0.0;
		int convertDirection = Integer.valueOf(pConvertDirection);
		//
		MyConverterUtil converter = new MyConverterUtil(inputValue);
		//
		switch (convertDirection) {
		case 1:
			outputValue = converter.getFahrenheit();
			break;
		case 2:
			outputValue = converter.getCelcius();
			break;
		default:
			break;
		}
		request.getSession().setAttribute("outputValue", outputValue);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("ConvertOutput.jsp");
		requestDispatcher.forward(request, response);
	}

	private class MyConverterUtil {
		double value;

		public MyConverterUtil(double inputValue) {
			this.value = inputValue;
		}

		public double getFahrenheit() {
			return 32 + (9. / 5) * this.value;

		}

		public double getCelcius() {
			return 5./9 * (this.value - 32);

		}
	}

}
