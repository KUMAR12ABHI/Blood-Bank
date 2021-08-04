
package in.abhi.bbs.pojo;

import in.abhi.bbs.conn.ConnectionProvider;

public class acControl {
private static  String ct="";
    public static String getCt() {
        return ct;
    }

    public static void setCt(String ct) {
        acControl.ct = ct;
    }
    public static int ctMethod(String st)
    {
        if(st.equals("donorde"))
            setCt(st);
        else if(st.equals("donorupd"))
            setCt(st);
        else if(st.equals("blooddet"))
           setCt(st);
        System.out.println("Checking acControl:"+acControl.ct);
        return ConnectionProvider.getId();
    }
}
