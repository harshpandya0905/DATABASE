//package HW3;

import java.sql.*;
import java.util.*;
import java.io.*;

@SuppressWarnings("deprecation")
 public class populate {
 
	 static Connection conn = null;
	 static ResultSet rs = null;
	 static Statement st = null;
	 static String query;
	 
		public populate() throws SQLException{
			
			connectDatabase();
		}
		 
		 public static void connectDatabase() throws SQLException
		{
			 System.out.println("Looking for Oracle's jdbc-odbc driver ... ");
			 DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
			 System.out.println("Loaded.");
			 String host = "dagobah.engr.scu.edu";
			 String port = "1521/db11g";
			
			 String JDBC_STRING = "jdbc:oracle:thin:@" + host + ":" + port; 
			 String USER_NAME = "hpandya";
			 String PASSWD = "9773306761a";
					
			 try {
				
				 conn = DriverManager.getConnection (JDBC_STRING, USER_NAME, PASSWD);
				 System.out.println("Connected.");
				 st = conn.createStatement ();
				 st.executeUpdate("delete from BUILDINGS_ON_FIRE");
				 st.executeUpdate("delete from building");
				 st.executeUpdate("delete from HYDRANTS_FOR_FIRE");
				 System.out.println("Data deleted from Tables");
				 
			 } 
			 catch (SQLException sqlEx) {
				
				 sqlEx.printStackTrace ();
			 } 
		 }
		 
		 public void insert_hydrantforfire(String hydrant_id, int X ,int Y)
		{
			try
			 {
				String hydrant_Query=null;
				
					if(!hydrant_id.equals("null")) 
					{
						hydrant_Query="insert into HYDRANTS_FOR_FIRE values ('"+hydrant_id+"', mdsys.sdo_geometry(2001,null,mdsys.sdo_point_type("+X+","+Y+",null),null,null))";
					}
					st.executeUpdate(hydrant_Query);
			 }
			 catch( Exception e )
			 {  
			
				e.printStackTrace();
			 }
		}
		  
		 public void insert_building(String bid, String bname, int vertices, int a[][])
		{
				try
				{
					String building_Query=null;
					int i = 0;
					int x1 = a[0][0], y1 = a[0][1];
					if(!bid.equals("null"))
					{
						
						building_Query="insert into building values ('"+bid+"','"+bname+"','"+vertices+"'";
						building_Query+=",mdsys.sdo_geometry(2003,null,null,sdo_elem_info_array(1,1003,1),sdo_ordinate_array(";
						while ( i < vertices )
						{
							building_Query+=a[i][0];
							building_Query+=",";
							building_Query+=a[i][1];
							building_Query+=", ";
							i++;
						}
						building_Query+=x1;
						building_Query+=",";
						building_Query+=y1;
						building_Query+=")))";
					}
					st.executeUpdate(building_Query);

			 }
			 catch( Exception e )
			 { 
				
				 e.printStackTrace();
			 }
		}
		public void insert_fireonbuilding(String fname)
		{
			try
			{
				
				String fireonbuild_Query = null;
				if(!fname.equals("null"))
				{
				   
					fireonbuild_Query = "insert into BUILDINGS_ON_FIRE values ('"+fname+"')";
					System.out.println(fireonbuild_Query);
				}
				st.executeUpdate(fireonbuild_Query);
				
			}
			catch( Exception e )
			{ 
			
				e.printStackTrace();
			}
		}
		
		public void readingoffiles(String f1, String f2, String f3)
		{		
			//	f1="C:\\Users\\vishesh\\Desktop\\winter 15\\Geospatial_Database-master\\hydrant.xy";
			//	f2="C:\\Users\\vishesh\\Desktop\\winter 15\\Geospatial_Database-master\\building.xy";
			//	f3="C:\\Users\\vishesh\\Desktop\\winter 15\\Geospatial_Database-master\\firebuilding.txt";
					  File firstF = new File (f1);
					  File secondF = new File (f2);
					  File thirdF = new File (f3);
					  FileInputStream fileInput = null;
					  BufferedInputStream bufferInput = null;
					  DataInputStream dataInput = null;
					  try{
							if(firstF != null)
							{
								fileInput = new FileInputStream(firstF);
								bufferInput = new BufferedInputStream(fileInput);
								dataInput = new DataInputStream(bufferInput);
								while (dataInput.available() != 0)
								{	
									String s1 = dataInput.readLine();
									StringTokenizer stoken = new StringTokenizer(s1, ", ");
									String hydrant_id = null;
									int X = 0,Y = 0;		    	 
									hydrant_id = stoken.nextToken();
									X = Integer.parseInt(stoken.nextToken().trim());
									Y = Integer.parseInt(stoken.nextToken().trim());
									this.insert_hydrantforfire(hydrant_id,X,Y);			
									
								}
								System.out.println( "HYDRANTS_FOR_FIRE table is now populated \n" );
							}
							
							if(secondF != null)
							{
							
								fileInput = new FileInputStream(secondF);
								bufferInput = new BufferedInputStream(fileInput);
								dataInput = new DataInputStream(bufferInput);
								
								while(dataInput.available() != 0)
								{
									
									int a[][] = new int [100][2];
									int i = 0;
									
									String s1 = dataInput.readLine();
									StringTokenizer stoken = new StringTokenizer(s1, ",");
									String bid = null, bname = null;
									int vert = 0;
									bid = stoken.nextToken();
									bname = stoken.nextToken().trim();
									vert = Integer.parseInt(stoken.nextToken().trim());
								  
									while(stoken.hasMoreTokens()) {
											a[i][0] = Integer.parseInt(stoken.nextToken().trim());
											a[i][1] = Integer.parseInt(stoken.nextToken().trim());
											i++;   	
									 }
									 this.insert_building(bid,bname,vert,a);   	
								}
								 System.out.println( "Building table is now populated \n" );
									
							}
							
							if( thirdF != null )
							{
								fileInput = new FileInputStream(thirdF);
								bufferInput = new BufferedInputStream(fileInput);
								dataInput = new DataInputStream(bufferInput);
								while(dataInput.available()!=0)
								{	
								String s1 = dataInput.readLine();
								String fname = null;;
								fname = s1;
								this.insert_fireonbuilding(fname);
								}
								System.out.println( "BUILDINGS ON FIRE table is now populated \n" );
							}
								
					  }
					  catch (FileNotFoundException e) {
					
						  e.printStackTrace();
					  } 
					  
					  catch (IOException e) {
					
						  e.printStackTrace();
					  }
					  catch(NumberFormatException e)
					  {
						 e.printStackTrace();
					  }
				}
 

public static void main (String [] args)throws SQLException  {
	 
	  populate h= new populate();
	  

	  String firstfile,secondfile,thirdfile;
	  firstfile = args[0];
	  secondfile = args[1];
	  thirdfile = args[2];
	  System.out.println(firstfile+secondfile+thirdfile);
	  h.readingoffiles(firstfile,secondfile,thirdfile);
 }
 }
