import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import org.json.JSONException;
import org.json.XML;


public class Xmltojson {

    private String studentXmlString;
    private String buildingXmlString;
    private int PRETTY_PRINT_INDENT_FACTOR = 4;
   
   /* 
    public void readInput() throws FileNotFoundException, IOException
    {
        System.out.println(fname);
        StringBuilder xmlString = new StringBuilder();
        //xmlString = FileUtils.readFileToString(fname, "UTF-8");
        try (BufferedReader br = new BufferedReader(new FileReader(fname))) {
            String line;
            while((line = br.readLine())!= null) {
                line.trim();
                //System.out.println(line);
                if(line.length() <= 0)
                    continue;
                xmlString.append(line);
                //System.out.println("After Concat "+xmlString);
            }
        }catch (FileNotFoundException err){
            System.out.println(err);
            System.exit(1);
        } catch (IOException err) {
            System.out.println(err);
            System.exit(1);
        }
        if(fname.contains("student")) {
           // studentXmlString = xmlString.toString();
            //System.out.println("Generating json for Students check output in students.json file");
           
        } else {
            buildingXmlString = xmlString.toString();
            System.out.println("Generating json for Buildings check output in buildings.json file");
            printJsonString("buildings.xml", "buildings.json");
        }
    }*/
    /**
     * @param args
     * @throws IOException 
     */
    public static void main(String[] args) throws IOException {
        // TODO Auto-generated method stub
        
        //String filename =  s;
        Xmltojson h = new Xmltojson();
        //h.readInput();
         h.printJsonString("student.xml", "students.json");
          h.printJsonString("buildings.xml", "buildings.json");
      
    }

    private void printJsonString(String xmlString, String filename) throws IOException {
        // TODO Auto-generated method stub
        try 
        {
            //xml String should contain the file name
            File file = new File(xmlString);
            FileInputStream fr= new FileInputStream(file);
            byte[] rdFile=new byte[(int)file.length()];
            fr.read(rdFile);
            fr.close();
            String xml= new String(rdFile,"UTF-8");
            System.out.println();
            org.json.JSONObject xmlJSONObj = XML.toJSONObject(xml);
            String jsonPrettyString = xmlJSONObj.toString(PRETTY_PRINT_INDENT_FACTOR);
            PrintWriter wr = new PrintWriter(filename, "UTF-8");
            wr.println(jsonPrettyString);
            wr.close();
            //System.out.println(jsonPrettyString);
        } catch (JSONException je) {
            System.out.println(je.toString());
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private void printXMLLine(String xmlString) {
        // TODO Auto-generated method stub
        System.out.println(xmlString);
    }

    private static void printUsage() {
        // TODO Auto-generated method stub
        System.out.println("Usage: xmltojson students.xml buildings.xml");
    }
}
