package hello;
import org.apache.log4j.Logger;
public class helloworld {
	final static Logger log = Logger.getLogger(helloworld.class);
public static void main(String [] args) {
	log.warn("WARNING: " + "bla bla");
	log.error("ERROR: " + "bla bla");
	log.info("INFO: " + "blabla"); 
}
}
