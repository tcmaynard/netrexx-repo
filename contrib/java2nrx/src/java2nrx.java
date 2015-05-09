import japa.parser.JavaParser;
import japa.parser.ast.CompilationUnit;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
 
 
public class java2nrx {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception {
		
		if (args.length == 0 || args[0].equals("-h") || args[0].equals("-H") || args[0].equals("--help") || args[0].equals("-?") ){
	        System.err.println("\nUsage : java -jar java2nrx <infile.java> [out.nrx]");
	        System.err.println("   Provide Java source file as input");
	        System.err.println("   Optionally followed by NetRexx output source file, if not given output goes to stdout");
			System.exit(2);	
		}
		
		System.out.println("java2nrx, the translator translator, version 1.0.0");
		System.out.println("Translating " + args[0]);
		
        FileInputStream in = new FileInputStream(args[0]);

        CompilationUnit cu;
        try {
            // parse the file
            cu = JavaParser.parse(in);
        } finally {
            in.close();
        }

        // prints the resulting compilation unit to default system output
        if (args.length == 2) {
        	OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(args[1]));
        	out.write(cu.toString());
        	out.close();
        	System.out.println("Written " + args[1]);
        } else {	
        	System.out.println(cu.toString());
        }
	}

}
