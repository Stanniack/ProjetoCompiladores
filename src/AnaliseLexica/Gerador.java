package AnaliseLexica;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.File;

/**
 *
 * @author Felipe
 */
public class Gerador {
    
    //Essa classe foi comentada pois ja foi gerada a classe lexer

    /**
     * @param args the command line arguments
     */
    public static void gerarLexer(String path){
        File file = new File(path);
        jflex.Main.generate(file);
        
    }
    public static void main(String[] args) {
        // TODO code application logic here
        String path = "C:\\Users\\fiodo\\OneDrive\\Documentos\\GitHub\\ProjetoCompiladores-master\\src\\AnaliseLexica\\Lexer.flex";
        gerarLexer(path);
        
    }
}
