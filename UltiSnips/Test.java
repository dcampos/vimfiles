/**
 *
 * @author Darlan P. de Campos
 * @version 1.0
 *
 */

public class Test {
    public static void main (String[] args) {
        try {
            System.out.println(2 / 0);
        } catch(Exception ex) {
            System.out.println("teste");
        }

        try {
            System.out.println(1+1);
        } catch(Exception e){
            e.printStackTrace();
        }

        if (1==1) {
            if (2==2) {
                System.out.println("aaa");
            }
        }

        try {
            if (1==1) {
                System.out.println("aaa");
            }
        } catch(RuntimeException ex){
            System.out.println("bbbb");
        }

        /**
         * A nice try-catch block.
         *
         * This is only for testing UltiSnips. It looks good to me,
         * except for the fact that it requires Python. Well, that
         * is not a huge problem on Linux machines, but it gets
         * complicated on Windows.
         *
         */
        try {
            
        } catch(Exception e) {
            
        }
        if (1==1) {
        
        } 
        if (1==1) {
            
        }
    }
}

