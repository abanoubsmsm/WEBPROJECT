/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package child_daos_implementation;

import child_daos_interfaces.ItemDaoInterface;
import dtos.Item;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author abanoub samy
 */
public class ItemDaoImplementation implements ItemDaoInterface{

    private Connection con;
    PreparedStatement statemnt;
    ResultSet res;

    public ItemDaoImplementation() {
    }

    

    public void close() {
        try {
            if (statemnt != null && !statemnt.isClosed()) {
                statemnt.close();
            }
            if (res != null && res.isClosed()) {
                res.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoImplementation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    @Override
    public ArrayList<Item> getItem(int index) throws SQLException {
        ArrayList<Item> list = new ArrayList<>();
        statemnt = con.prepareStatement("SELECT  qubtity, price, item_name, item_id, catagory, pic FROM item LIMIT 10 OFFSET ?");
        statemnt.setInt(1, index);
        res = statemnt.executeQuery();
        while (res.next()) {
            try {
                Item item = new Item();
                item.setItem_id(res.getInt(ITEM_ID));
                item.setItem_catagory(res.getString(ITEM_CATAGORY));
                item.setItem_name(res.getString(ITEM_NAME));
                Blob b = res.getBlob(ITEM_PIC);
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                InputStream in = b.getBinaryStream();
                byte[] buf = new byte[1024];
                int iterator = 0;
                while ((iterator = in.read(buf)) >= 0) {
                    baos.write(buf, 0, iterator);

                }

                in.close();
                byte[] bytes = baos.toByteArray();
                item.setItem_pic(bytes);
                item.setItem_quntity(res.getInt(ITEM_QUTITY));
                item.setItem_price(res.getInt(ITEM_PRICE));
      
                list.add(item);

            } catch (IOException ex) {
                Logger.getLogger(ItemDaoImplementation.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return list;
    }

    @Override
    public boolean decrementItem(int itemId) throws SQLException {
        statemnt = con.prepareStatement("UPDATE item SET qubtity = qubtity -1 where item_id = ? and qubtity > 0");
        statemnt.setInt(1, itemId);
        int i = statemnt.executeUpdate();

        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean insert(Item item) {
        try {
            statemnt = con.prepareStatement(" INSERT INTO item (  qubtity, price, item_name, catagory, pic "
                    + ") VALUES "
                    + "( ? , ? , ? , ? , ?  )");
            statemnt.setInt(1, item.getItem_quntity());
            statemnt.setInt(2, item.getItem_price());
            statemnt.setString(3, item.getItem_name());
            statemnt.setString(4, item.getItem_catagory());
            statemnt.setBinaryStream(5, new ByteArrayInputStream(item.getItem_pic()));
          
            int i = statemnt.executeUpdate();
            if (i > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            
            Logger.getLogger(ItemDaoImplementation.class.getName()).log(Level.SEVERE, null, ex);
       return false;
        }
    }

    @Override
    public boolean update(Item item)  {
        try {
            statemnt = con.prepareStatement("UPDATE item SET qubtity = ? , price = ? , item_name = ?, catagory =?, pic =  ?, where item_id = ?");
            statemnt.setInt(1, item.getItem_quntity());
            statemnt.setInt(2, item.getItem_price());
            statemnt.setString(3, item.getItem_name());
            statemnt.setString(4, item.getItem_catagory());
            statemnt.setBinaryStream(5, new ByteArrayInputStream(item.getItem_pic()));

            statemnt.setInt(6, item.getItem_id());
            int i = statemnt.executeUpdate();
            System.out.println(i);
            if (i > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemDaoImplementation.class.getName()).log(Level.SEVERE, null, ex);
        
        return false;
        
        }
    }

    @Override
    public Item select(Item t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Item> convertResultSetToArrayList(ResultSet rs) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Item> reterieveAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
