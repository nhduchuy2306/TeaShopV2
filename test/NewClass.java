
import org.nocrala.tools.texttablefmt.BorderStyle;
import org.nocrala.tools.texttablefmt.CellStyle;
import org.nocrala.tools.texttablefmt.CellStyle.HorizontalAlign;
import org.nocrala.tools.texttablefmt.ShownBorders;
import org.nocrala.tools.texttablefmt.Table;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Huy
 */
public class NewClass {

    public static void main(String[] args) {
        CellStyle numberStyle = new CellStyle(HorizontalAlign.right);

        Table t = new Table(3, BorderStyle.DESIGN_FORMAL,
            ShownBorders.SURROUND_HEADER_FOOTER_AND_COLUMNS);
        t.setColumnWidth(0, 8, 14);
        t.setColumnWidth(1, 20, 100);
        t.setColumnWidth(2, 9, 16);

        t.addCell("Region");
        t.addCell("Orders", numberStyle);
        t.addCell("Sales", numberStyle);

        t.addCell("North");
        t.addCell("Hi-Tea Dâu Tây Mận Muối Aloe Vera", numberStyle);
        t.addCell("$87.230", numberStyle);

        t.addCell("Center");
        t.addCell("837", numberStyle);
        t.addCell("$12.855", numberStyle);

        t.addCell("South");
        t.addCell("5,344", numberStyle);
        t.addCell("$72.561", numberStyle);

        t.addCell("Total", numberStyle, 2);
        t.addCell("$172.646", numberStyle);

        String a = t.render();
        System.out.println(a);
    }
}
