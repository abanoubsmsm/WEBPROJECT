/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import dtos.Item;
import java.util.ArrayList;

/**
 *
 * @author Altysh
 */
public class ArrayUtail {
    public static ArrayList<JspRow> getArray( ArrayList<Item> list)
    {
      ArrayList<JspRow> rows = new ArrayList<>();
      JspRow jsp = new JspRow();
      
      for(Item i:list)
      {if(!rows.contains(jsp))
          rows.add(jsp);
          if(jsp.getElements().size()<3)
          {
              jsp.getElements().add(i);
          }
          else{
              
              jsp = new JspRow();
              
              jsp.getElements().add(i);
          }
      }
      return rows;
    }
}
