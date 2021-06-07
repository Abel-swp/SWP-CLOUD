package bg;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BGController {
	
	@Autowired
	ServletContext application;
	
	private static final Logger logger = LoggerFactory.getLogger(BGController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/main.bg", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	@RequestMapping(value = "/generic.bg", method = RequestMethod.GET)
	public String generic() {
		return "generic";
	}
	@RequestMapping(value = "/elements.bg", method = RequestMethod.GET)
	public String elements() {
		return "elements";
	}
	@RequestMapping(value = "/main2.bg", method = RequestMethod.GET)
	public String main2() {
		return "main2";
	}
	@RequestMapping(value = "/generic2.bg", method = RequestMethod.GET)
	public String generic2() {
		return "generic2";
	}
	@RequestMapping(value = "/elements2.bg", method = RequestMethod.GET)
	public String elements2() {
		return "elements2";
	}
	
}
