package in.abhi.bbs.conn;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnectionProvider {
    private static Connection conn;
    private static int id=0;
    private static String username="";
    public static int getId() {
        return id;
    }

    public static void setId(int id) {
        ConnectionProvider.id = id;
    }

    public static String getUsername() {
        return username;
    }

    public static void setUsername(String username) {
        ConnectionProvider.username = username;
    }
    
    
    static 
    {
       try
        {
            Class.forName("oracle.jdbc.OracleDriver");
            conn=DriverManager.getConnection("jdbc:oracle:thin:@//ABHI:1521/XE", "techblog", "project");
            System.out.println("Connected successfully to the DB");
            //JOptionPane.showMessageDialog(null, "Connected successfully to the DB");
            
        }
        catch(Exception ex)
        {
           // JOptionPane.showMessageDialog(null, "Cannot connect to the DB");
            System.out.println("Can not connenct with DB"+ex);
            ex.printStackTrace();
            System.exit(1);
            
        }  
    }
    
  public static Connection getConnection()
  {
      return conn;
  }
  public static void closeConnection()
  {
     try{
      conn.close();
      //JOptionPane.showMessageDialog(null, "Disconnected Seccuesfully the DB");
      System.out.println("Disconnected Seccuesfully the DB");
     }
     catch(Exception ex)
        {
           // JOptionPane.showMessageDialog(null, "Cannot Disconnect to the DB");
             System.out.println("Cannot Disconnect to the DB"+ex);
            ex.printStackTrace();
            
            
        }  
  }
    
}
