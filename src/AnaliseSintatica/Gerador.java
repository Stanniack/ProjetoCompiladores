package AnaliseSintatica;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import AnaliseLexica.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Felipe
 */
public class Gerador {

    //Essa classe foi comentada pois ja foi gerada a classe lexer
    /**
     * @param args the command line arguments
     */
    public static void gerarLexer(String path) {
        File file = new File(path);
        jflex.Main.generate(file);

    }

    public static void main(String[] args) {
        // TODO code application logic here
        String path = "C:\\Users\\fiodo\\OneDrive\\Documentos\\GitHub\\ProjetoCompiladores-master\\src\\AnaliseSintatica\\Lexer.flex";
        gerarLexer(path);

        String teste = "Begin String teste; Float neste; teste = 10; neste = 56; String leste = '56', oeste = '57'; End";
        String teste2 = "Begin Integer teste[10] = [10, 5, 'teste']; for (String var : var) {teste = 10;} End";

        StringReader st = new StringReader(teste2);
        parser p = new parser(new Yylex(st));

        try {
            System.out.println(p.parse());
            //System.out.println(p.s.sym);

        } catch (Exception ex) {
            Logger.getLogger(Gerador.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
